class SessionsController < ApplicationController
    def new; end
    def create
      if params[:email]=='jay@gmail.in'
        if params[:password]=='jay'
          redirect_to :controller => 'products', :action => 'index'
          session[:role]='admin'
        else
          flash.now[:alert] = 'Invalid email or password'
        render :new
        end
      
    else
      user = User.find_by(email: params[:email])
      # finds existing user, checks to see if user can be authenticated
      if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
        session[:user_id] = user.id
        session[:role]='user'
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
  end



    def destroy
      # deletes user session
      session[:user_id] = nil
      session[:role] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
  end