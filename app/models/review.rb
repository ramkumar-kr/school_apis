class Review < ActiveRecord::Base
  belongs_to :user, class_name: User
  belongs_to :school, class_name: School
  has_many :categories, dependent: :destroy

  def categories
    Category.where(review_id: id)
  end

  def rating
    sum = 0
    categories.each do |category|
      sum = sum + category.rating
    end
    sum == 0 ? 0: sum / (categories.count)
  end

  def infra_rating
    sum = 0
    infra_categories = Category.where(review_id: id, name: 'Infrastructure')
    infra_categories.each do |category|
      sum = sum + category.rating
    end
    sum == 0 ? 0: sum / (infra_categories.count)
  end

  def teaching_rating
    sum = 0
    teaching_categories = Category.where(review_id: id, name: 'Teaching')
    teaching_categories.each do |category|
      sum = sum + category.rating
    end
    sum == 0 ? 0: sum / (teaching_categories.count)
  end

  def user_name
    User.find(user_id).name
  end

  def to_hash
    hash = {}
    instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    hash
  end

  def hash_with_user
    hash = {}
    Review.all.each do |r|
      hash = r.attributes
      hash[:user_name] = r.user_name
    end
    hash
  end
end
