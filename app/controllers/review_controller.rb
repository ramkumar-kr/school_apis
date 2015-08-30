class ReviewController < ApplicationController
  skip_before_action :verify_authenticity_token
  http_basic_authenticate_with name: "hackathon", password: "urbanladder", except: [:index, :show]

  def create
    @review = Review.new(review_params)
    if @review.save!
      names = params[:names].split(",")
      ratings = params[:ratings].split(",")
      hash = Hash[names.zip(ratings)]
      hash.each do |name, rating|
        c = Category.new({name: name,rating: rating})
        c.review_id = @review.id
        c.save!
      end
      render json: @review
    else
      render json: {message: "Failure"} 
    end

  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def index
    data = []
    Review.all.each do |r|
      data << {review: r, rating: {overall: r.rating, infrastructure: r.infra_rating, teaching: r.teaching_rating}, categories: r.categories}
    end

    render json: {data: data}
  end

  def show
    @review = Review.find(params[:id])
    render json: {review: @review, rating: {overall: @review.rating, infrastructure: @review.infra_rating, teaching: @review.teaching_rating}, categories: @review.categories}
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render json: {message: "success"}
  end

  private
   def review_params
     params.permit(:comment, :user_id, :school_id)
   end

   def category_params
     params.permit(:name, :rating)
   end
end
