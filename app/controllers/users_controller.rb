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

  # def set_user
  #   @user = Teste.find(params[:id])
  # end

  def user_params
    params.permit(:name, :password_digest, :cpf)
  end
end

# # GET /testes
# def index
#   @testes = Teste.all

#   render json: @testes
# end

# # GET /testes/1
# def show
#   render json: @user
# end

# # POST /testes
# def create
#   @user = Teste.new(user_params)

#   if @user.save
#     render json: @user, status: :created, location: @user
#   else
#     render json: @user.errors, status: :unprocessable_entity
#   end
# end

# # PATCH/PUT /testes/1
# def update
#   if @user.update(user_params)
#     render json: @user
#   else
#     render json: @user.errors, status: :unprocessable_entity
#   end
# end

# # DELETE /testes/1
# def destroy
#   @user.destroy
# end

# private
#   # Use callbacks to share common setup or constraints between actions.
#   def set_user
#     @user = Teste.find(params[:id])
#   end

#   # Only allow a list of trusted parameters through.
#   def user_params
#     params.fetch(:user, {})
#   end
