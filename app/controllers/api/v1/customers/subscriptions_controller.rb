class Api::V1::Customers::SubscriptionsController < ApplicationController

  def index
    begin
      customer = Customer.find(params[:customer_id])
      render json: CustomerSerializer.new(customer)
    rescue
      render json: { error: 'Error' }, status: 401
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
        render json: { error: 'Error' }, status: 401
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Error' }, status: 401
    end
  end

  def update
    begin
      if params[:cancel] == 'true'
        subscription = Subscription.find(params[:subscription_id])
        subscription.update(status: 1)
        subscription.save
        render json: SubscriptionSerializer.new(subscription)
      else
        render json: { error: 'Error' }, status: 401
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Error' }, status: 401
    end
  end

end
