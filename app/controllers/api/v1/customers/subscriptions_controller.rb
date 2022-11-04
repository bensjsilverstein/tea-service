class Api::V1::Customers::SubscriptionsController < ApplicationController

  def index
    begin
      customer = Customer.find(params[:customer_id])
      render json: CustomerSerializer.new(customer)
    rescue
      render json: { error: 'invalid credentials' }, status: 401
    end
  end

  def create
    begin
      tea = Tea.find(params[:tea_id])
      subscription = Subscription.create(price: params[:price], status: params[:status], frequency: params[:frequency], customer_id: params[:customer_id], tea_id: params[:tea_id])
      subscription.update(title: "#{subscription.frequency} #{subscription.tea.title}")
      if subscription.save
        render json: SubscriptionSerializer.new(subscription), status: 201
      else
        render json: ErrorSerializer.bad_subscription
      end
    rescue ActiveRecord::RecordNotFound
      render json: ErrorSerializer.bad_subscription
    end
  end
  
end
