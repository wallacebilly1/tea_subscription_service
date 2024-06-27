class Api::V1::SubscriptionsController < ApplicationController 
  def create
    require 'pry'; binding.pry
    subscription = Subscription.new(subscription_params)
    subscription.save!
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update!(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 200
  end

  private
  def subscription_params
    params.require(:subscription)
          .permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end