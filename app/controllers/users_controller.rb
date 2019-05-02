class UsersController < ApplicationController
  def show
    @user = User.find(params['id'])
  end
  def new
    @user = User.new
  end
  def create
    password_match = false

    if params[:password] == params[:password_confirmation]
      password_match = true
    else
      password_match = false
      flash.now[:danger] = "Passords don't match"
    end
    # puts "*"*60, params['city_id']
    user_params = params.require(:user).permit(:first_name, :last_name, :age, :email, :password)
    # puts "*"*60,user_params
    user_params['city_id'] = params['city_id']
    use = User.create!(user_params)
    use.save
  end
end
