require 'rails_helper'

RSpec.describe 'API::V1::Subscriptions', type: :request do
  describe 'POST /api/v1/subscriptions' do
    before(:each) do
      @tea = create(:tea)
      @customer = create(:customer)

      @headers = {"CONTENT_TYPE" => "application/json"}
      @body = {
        title: "Special Tea Subscription",
        price: 25,
        status: 0,
        frequency: 12,
        tea_id: @tea.id,
        customer_id: @customer.id
      }
    end

    it 'creates a subscription for a customer and a tea' do
      post '/api/v1/subscriptions', headers: @headers, params: JSON.generate(@body)

      expect(response).to be_successful
      expect(response.status).to eq 201

      @subscription = Subscription.last

      expect(@subscription.title).to eq("Special Tea Subscription")
      expect(@subscription.price).to eq(25)
      expect(@subscription.status).to eq("active")
      expect(@subscription.frequency).to eq(12)
      expect(@subscription.customer).to eq(@customer)
      expect(@subscription.tea).to eq(@tea)
    end

    # error handling / testing
  end
end