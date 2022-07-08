require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "GET /reviews" do
    it "without authentication" do
      user=create(:user)
      get '/users/'+user.id.to_s+'/reviews'
      expect(response).to have_http_status(302)
    end
    it "with authentication" do
      user=create(:user)
      post sessions_url, params: { email: user.email, password: user.password}
      get '/users/'+user.id.to_s+'/reviews'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET edit /reviews" do
    it "new review" do
      user=create(:user, email:"tes1212t@gmail.com")
      review= create(:review)
      post sessions_url, params: { email: user.email, password: user.password}
      get '/reviews/'+review.id.to_s+'/edit'
      expect(response).to have_http_status(200)
    end 
  end   

  describe "CREATE REVIEWS" do
    it "new review" do
      user=create(:user,email:"Tests@gmail.com")
      restaurant=create(:restaurant)
      post sessions_url, params: { email: user.email, password: user.password}
      post '/reviews', params:{review:{ratings:"Check"}, restaurant_id: restaurant.id}
      expect(response).to have_http_status(302)
    end
  end 

  # describe "Update REVIEWS" do
  #   it "update review without logging in" do
  #     user= create()

  #   end
  # end  
end
