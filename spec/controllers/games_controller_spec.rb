require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  it "GET#index functions" do
    get :index
    expect(response).to have_http_status(200)
  end
end
