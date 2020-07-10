class UsersController < ApplicationController
    # def index
    #     render plain: "I'm in the index action!"
    # end

    # def create
    #     render json: params
    # end 

    # def show 
    #     render json: params
    # end 

    def index 
        render josn: User.all
    end 

    def create 
        user = User.new(user_params)
        if user.save 
            render json: user 
        else  
            render json: user.error, status: :unprocessable_entity
        end 
    end 

    def show 
        # render json: User.find(params[:id])
        render json: User.find(params[:id])
    end 

    
    
    private
    
    def user_params 
        params.require(:user).permit(:name, :email)
    end 

end


