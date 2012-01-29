class SessionsController < ApplicationController

  respond_to :json

  # POST /sessions
  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render :json => { authorized: 'true' }
    else
      render :json => { :authorized => 'false' }
    end
  end


  # DELETE /sessions/1
  def destroy
    session[:user_id] = nil
    head :ok
  end


end
