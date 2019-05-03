class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params['email'])

    if user && user.authenticate(params['password'])
      session[:user_id] = user.id

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
    
    #redirect_to '/'
  end
  def destroy
    puts "$"*60
    # session.delete('user_id')
    reset_session

    redirect_to request.headers["HTTP_REFERER"]
    # render request.env['PATH_INFO']
  
    # render 'new'
  end
  def new
  end
end
