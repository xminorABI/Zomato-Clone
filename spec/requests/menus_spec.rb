require 'rails_helper'

RSpec.describe 'Menus', type: :request do
  describe 'GET /menus' do
    it 'get /Index' do
      restaurant = create(:restaurant)
      get '/restaurants/' + restaurant.id.to_s + '/menus', params: { restaurant_id: restaurant.id }
    end
  end
end
