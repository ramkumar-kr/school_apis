class SchoolController < ApplicationController
  skip_before_action :verify_authenticity_token
  http_basic_authenticate_with name: "hackathon", password: "urbanladder", except: [:index, :show]

  def create
    @school = School.new(school_params)
    @location = Location.new(location_params)
    @location.save!
    @school.location_id = @location.id
    if @school.save!
      render json: @school
    else
      render json: {message: "Failure"} 
    end
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      redirect_to @school
    else
      render 'edit'
    end
  end

  def nearby
    @school = School.all
    coordinates = {latitude: params[:latitude].to_f, longitude: params[:longitude].to_f}
    user_location = Location.new({latitude: params[:latitude], longitude: params[:longitude]})
    
    result = []
    @school.each do |s|
      result << {school: s, location: s.location} if (s.location.distance(user_location)) <= 10
    end
    render json: result
  end

  def index
    hash = School.all.each_with_object({}) do |s, h|
      h[s.id] = {school: s, location: s.location}
    end
    render json: hash
  end

  def show
    @school = School.find(params[:id])
    render json: {school: @school, location: @school.location}
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    render json: {message: "success"}
  end

  private
   def school_params
     params.permit(:name, :email, :phone, :address, :website)
   end

   def location_params
     params.permit(:latitude, :longitude)
   end
end
