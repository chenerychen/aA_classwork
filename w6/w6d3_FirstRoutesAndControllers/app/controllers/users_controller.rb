class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    # def create
    #     render json: params
    # end 

     # app/controller/users_controller.rb
    def create
        user = User.new(user_params)
        if user.save
            render json: user 
        else 
            render json: user.errors.full_messages, status: 422
        end

    end 

    def show 
        # the params should show us this specific user
        render json: User.find(params[:id])
    end 

#   def update
#     # params[:id] is a routing parameter; more in a sec!
#     @cat = Cat.find(params[:id])
#     @cat.update!(cat_params)
#     render json: @cat
#   end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
        # redirect has to do with views (ie,starts request response cycle 
        # when you want to send the client to a new page)
            # redirect_to "/users/ #{user.id}"
        # we cant redirect here bc we would lose information from the user bc in essense
        # we start a new request response cycle when we redirect_to

            # rendering stays in the same cycle
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end

        # user = User.find(params[:id]) 
        # user.update(params.require(:user).permit(:name, :email))
        # render json: user

    end
        
   
    # this is a user controller 
    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end



    # {"favorite_food"=>"pizza"}
# some_category[a_key]: 'another value'
# some_category[a_second_key]: 'yet another value'
# user[name]  "yusei"
# user[email]   "yusei@yusei.com"
    private 
    def user_params
        params.require(:user).permit(:name, :email)
    end 

end


