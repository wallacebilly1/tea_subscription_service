class Api::V1::SubscriptionsController < ApplicationController 
  def create
    subscription = Subscription.new(subscription_params)
    subscription.save!
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  private
  def subscription_params
    params.require(:subscription)
          .permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end