class UsersController < ApplicationController
  def index

  end

  def register
    user_name = params[:user_name]
    password = params[:password]
    if  user_name.nil? || password.nil? || user_name.strip.empty? || password.strip.empty?
      flash[:notice] = "user name and password are required"
      redirect_to "/"
    end


  end #def
end #class
