class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  http_basic_authenticate_with name: "hackathon", password: "urbanladder", except: [:index, :show]
  def new
    @user = User.new
    render json: @user
  end

  def create
    encrypted_password = password(params[:encrypted_password])
    @user = User.new(user_params)
    @user.encrypted_password = encrypted_password
    if @user.save!
      render json: @user
    else
      render json: {message: "Failure"} 
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
  end

  def login
    encrypted_password = password(params[:password])
    @user = User.find_by(email: params[:email])
    if @user.encrypted_password == encrypted_password
      render json: @user
    else
      render json: {message: "Login failure"}
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "success"}
  end

  def index
    @user = User.all
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private
   def user_params
     params.permit(:name, :email, :phone, :address, :number_of_children, :encrypted_password)
   end

   def password(string)
     crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
     encrypted_data = crypt.encrypt_and_sign(string)
   end
 end
