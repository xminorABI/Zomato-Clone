class ReviewsController < ApplicationController

    def index
        if logged_in?
        @user=User.find(current_user.id)
        else
            redirect_to login_path
        end   
    end

    def create
        @restaurant=Restaurant.find(params[:restaurant_id])
        @res=@restaurant.reviews.new(review_params)
        @res.user_id=current_user.id
        @res.save
        redirect_to @restaurant
    end

    # Need edit and update actions
  
    def edit
        @review=Review.find(params[:id])
    end
    
    def update
        @review = Review.find(params[:id])

        if logged_in? && current_user.isadmin && @review.update(isApproved: true)
          redirect_to admin_approval_path
        elsif logged_in? && !current_user.isadmin && @review.update(review_params) && @review.update(isApproved: false)
            redirect_to user_path(current_user.id)
        else
          render login_path, status: :unprocessable_entity
        end
    end


    def show
        @user=User.find(current_user.id)
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to admin_path, status: :see_other
      end
      
    private
    def review_params
        params.require(:review).permit(:ratings)
    end
end
