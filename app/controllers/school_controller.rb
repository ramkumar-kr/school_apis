class SchoolController < ApplicationController
  skip_before_action :verify_authenticity_token
  http_basic_authenticate_with name: "hackathon", password: "urbanladder", except: [:index, :show]

  def create
    @school = School.new(school_params)
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

  def index
    @school = School.all
    render json: @school
  end

  def show
    @school = School.find(params[:id])
    render json: @school
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

end
