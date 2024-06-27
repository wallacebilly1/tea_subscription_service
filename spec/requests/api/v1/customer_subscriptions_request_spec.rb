require 'rails_helper'

RSpec.describe 'API::V1::CustomerSubscriptions', type: :request do
  describe 'GET /api/v1/customer_subscriptions' do
    before(:each) do
      @customer1 = create(:customer)
      @customer2 = create(:customer)

      @tea1 = create(:tea)
      @tea2 = create(:tea)
      @tea3 = create(:tea)

      @subscription1 = create(:subscription, tea: @tea1, customer: @customer1)
      @subscription2 = create(:subscription, tea: @tea2, customer: @customer1)
      @subscription3 = create(:subscription, tea: @tea3, customer: @customer1, status: 1)
      @subscription4 = create(:subscription, tea: @tea1, customer: @customer2)

      @headers = {"CONTENT_TYPE" => "application/json"}
    end

    it 'returns a collection of a customers subscriptions, active and cancelled' do
      get "/api/v1/customers/#{@customer1.id}/subscriptions", headers: @headers

      expect(response).to be_successful
      expect(response.status).to eq 200

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key(:data)
      expect(result[:data]).to be_a(Hash)
      
      data = result[:data]

      expect(data).to have_key(:subscriptions)
      expect(data[:subscriptions]).to be_a(Hash)

      subscriptions = data[:subscriptions]

      expect(subscriptions).to have_key(:active)
      expect(subscriptions[:active]).to be_a(Array)
      expect(subscriptions).to have_key(:cancelled)
      expect(subscriptions[:cancelled]).to be_a(Array)

      active = subscriptions[:active]

      expect(active.length).to eq(2)
      expect(active[0]).to have_key(:title)
      expect(active[0][:title]).to eq(@subscription1.title)
      expect(active[0]).to have_key(:price)
      expect(active[0][:price]).to eq(@subscription1.price)
      expect(active[0]).to have_key(:status)
      expect(active[0][:status]).to eq(@subscription1.status)
      expect(active[0]).to have_key(:frequency)
      expect(active[0][:frequency]).to eq(@subscription1.frequency)
      expect(active[0]).to have_key(:tea_id)
      expect(active[0][:tea_id]).to eq(@subscription1.tea_id)
      expect(active[0]).to have_key(:customer_id)
      expect(active[0][:customer_id]).to eq(@subscription1.customer_id)
      expect(active[1]).to have_key(:title)
      expect(active[1][:title]).to eq(@subscription2.title)
      expect(active[1]).to have_key(:price)
      expect(active[1][:price]).to eq(@subscription2.price)
      expect(active[1]).to have_key(:status)
      expect(active[1][:status]).to eq(@subscription2.status)
      expect(active[1]).to have_key(:frequency)
      expect(active[1][:frequency]).to eq(@subscription2.frequency)
      expect(active[1]).to have_key(:tea_id)
      expect(active[1][:tea_id]).to eq(@subscription2.tea_id)
      expect(active[1]).to have_key(:customer_id)
      expect(active[1][:customer_id]).to   eq(@subscription2.customer_id)

      cancelled = subscriptions[:cancelled]

      expect(cancelled[0]).to have_key(:title)
      expect(cancelled[0][:title]).to eq(@subscription3.title)
      expect(cancelled[0]).to have_key(:price)
      expect(cancelled[0][:price]).to eq(@subscription3.price)
      expect(cancelled[0]).to have_key(:status)
      expect(cancelled[0][:status]).to eq(@subscription3.status)
      expect(cancelled[0]).to have_key(:frequency)
      expect(cancelled[0][:frequency]).to eq(@subscription3.frequency)
      expect(cancelled[0]).to have_key(:tea_id)
      expect(cancelled[0][:tea_id]).to eq(@subscription3.tea_id)
      expect(cancelled[0]).to have_key(:customer_id)
      expect(cancelled[0][:customer_id]).to eq(@subscription3.customer_id)
    end

    # it 'returns an error message if an invalid tea id is passed' do
    #   @body[:tea_id] = 123123
    #   post '/api/v1/subscriptions', headers: @headers, params: JSON.generate(@body)

    #   expect(response).to_not be_successful
    #   expect(response.status).to eq(422)
    # end
  end
end