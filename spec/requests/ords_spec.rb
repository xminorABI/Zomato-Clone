require 'rails_helper'

RSpec.describe 'Ords', type: :request do
  describe 'GET /index ords' do
    it ' get ords page' do
      user = FactoryBot.create(:user, email: 'check@gmail.com', password: 'Abhi', password_confirmation: 'Abhi')
      post sessions_url, params: { email: user.email, password: user.password }
      restaurant = create(:restaurant)
      menu1 = create(:menu, restaurant: restaurant)
      menu2 = create(:menu, restaurant: restaurant)

      get '/ords', params: { restaurant_id: restaurant.id, accept: %w[1 2], quantity: ['1', '', '5'] }

      expect(response).to have_http_status(200)
    end
  end

  describe 'Post /create ords' do
    it ' get ords page' do
      user = FactoryBot.create(:user, email: 'check@gmail.com', password: 'Abhi', password_confirmation: 'Abhi')
      post sessions_url, params: { email: user.email, password: user.password }
      restaurant = create(:restaurant)
      menu1 = create(:menu, restaurant: restaurant)
      menu2 = create(:menu, restaurant: restaurant)

      post '/ords',
           params: { restaurant_id: restaurant.id, menu_arr: '1 4', quantity_arr: '1 50', street: 'Test', city: 'Test',
                     pincode: '700112' }

      expect(response).to redirect_to(gmapps_path)
    end
  end
end
