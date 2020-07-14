class SessionsController < ApplicationController
  
    def   
        render :new 
    end 

    def create 
        user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        
        if user.nil?
          # if user doesn't exist, do .....
          flash[:errors] = 'Invalid username/password'
          render :new
        else
          # if user exists, do .....
          login_user!(user)
          redirect_to cats_url 
        end
    end 

    def destroy
      logout_user!
      
    end 

    
    
end