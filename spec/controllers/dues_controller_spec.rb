require 'rails_helper'

RSpec.describe DuesController, type: :controller do
  describe "dues#index action" do
    it "should successfully show log in and show the dues page" do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
