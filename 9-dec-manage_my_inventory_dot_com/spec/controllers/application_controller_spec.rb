require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render text: 'pass'
    end
  end

  describe 'being logged in' do
    it 'is logged in when there is a merchant_id in the session' do
      merchant = FactoryGirl.create :merchant
      result = get :index, {}, {merchant_id: merchant.id}
      expect(result.body).to eq 'pass'
    end

    it 'is not logged in otherwise' do
      result = get :index
      expect(result).to be_a_redirect
      # if method =~ /^be_(?:a_)?(.*)$/
      #   "#{$1}?"
      # /have_(?:a_)?(.*)/   ie expect(page).to have_content(something)
      #   "has_a_#{$1}?"        assert page.has_content?(something)
    end
  end
end
