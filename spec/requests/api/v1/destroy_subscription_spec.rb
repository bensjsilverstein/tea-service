require 'rails_helper'

RSpec.describe 'Cancel Customer Subscription Endpoint' do

    it 'Cancels a tea subscription' do
      customer_1 = Customer.create!(first_name: "Ben", last_name: "S", email: "BenS@email.email", address: "123 Sesame St")
      customer_2 = Customer.create!(first_name: "Greg", last_name: "P", email: "GP@email.email", address: "234 Sesame St")

      tea_1 = Tea.create!(title: "Green", description: "It's green.", temperature: 111, brew_time: "1 minute")
      tea_2 = Tea.create!(title: "Black", description: "It's black.", temperature: 112, brew_time: "2 minutes")
      tea_3 = Tea.create!(title: "Orange Blossom", description: "It's ORANGE.", temperature: 113, brew_time: "3 minutes")
      subscription = Subscription.create!(title: 'Green Tea Subscription', price: 49.98, status: 0, frequency: 0, customer_id: customer_1.id, tea_id: tea_1.id)

      post '/api/v1/subscriptions/cancel', headers: headers, params:{ subscription_id: subscription.id, cancel: true }

      expect(response).to be_successful
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash

      data = result[:data]
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a String

      expect(data).to have_key(:type)
      expect(data[:type]).to be_a String
      expect(data[:type]).to eq("subscription")

      attributes = data[:attributes]
      expect(attributes).to have_key(:status)
      expect(attributes[:status]).to eq("Cancelled")
      expect(customer_1.subscriptions[0].status).to eq("Cancelled")
    end

  end
