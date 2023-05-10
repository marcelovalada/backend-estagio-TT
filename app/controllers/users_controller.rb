class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.order(created_at: :desc)
    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created#, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH /users/1
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])

    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :cpf, :email)
  end
end
