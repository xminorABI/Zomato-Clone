require 'rails_helper'

RSpec.describe "BookOfflines", type: :request do
  describe "GET /new bookings" do
    it "new boking without signing in" do
      restaurant= create(:restaurant)
      get '/restaurants/'+restaurant.id.to_s+'/book_offline/new'
      expect(response).to redirect_to(login_path)  
    end

    it "new boking with signing in" do
      restaurant= create(:restaurant)
      user=create(:user)
      post sessions_url, params:{email: user.email, password: user.password}

      get '/restaurants/'+restaurant.id.to_s+'/book_offline/new'
      expect(response).to have_http_status(200)  
    end
  end

  describe "POST /CREATE bookings" do
    it "create booking without signing in" do
      restaurant= create(:restaurant)
      post '/restaurants/'+restaurant.id.to_s+'/book_offline/',params:{id: restaurant.id, head: 2}
      expect(response).to redirect_to(login_path)  

    end 
    it "create booking after signing in" do
      restaurant= create(:restaurant)
      user=create(:user)
      post sessions_url, params:{email: user.email, password: user.password}

      post '/restaurants/'+restaurant.id.to_s+'/book_offline/',params:{id: restaurant.id, head: 2}
      expect(response).to redirect_to(restaurants_path)  
    end 
  end  
end
