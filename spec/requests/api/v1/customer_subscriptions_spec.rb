require 'rails_helper'

RSpec.describe 'Get All Customer Subscriptions Endpoint' do

    it 'Returns active and cancelled subscriptions' do
      customer_1 = Customer.create!(first_name: "Ben", last_name: "S", email: "BenS@email.email", address: "123 Sesame St")

      tea_1 = Tea.create!(title: "Green", description: "It's green.", temperature: 111, brew_time: "1 minute")
      tea_2 = Tea.create!(title: "Black", description: "It's black.", temperature: 112, brew_time: "2 minutes")
      tea_3 = Tea.create!(title: "Orange Blossom", description: "It's ORANGE.", temperature: 113, brew_time: "3 minutes")
      subscription = Subscription.create!(title: 'Green Tea Subscription', price: 3.50, status: 0, frequency: 0, customer_id: customer_1.id, tea_id: tea_1.id)
      subscription = Subscription.create!(title: 'Black Tea Subscription', price: 3.50, status: 0, frequency: 0, customer_id: customer_1.id, tea_id: tea_2.id)
      subscription = Subscription.create!(title: 'Orange Blossom Tea Subscription', price: 3.50, status: 0, frequency: 0, customer_id: customer_1.id, tea_id: tea_3.id)

      get '/api/v1/customer/subscriptions', headers: headers, params:{ customer_id: customer_1.id }
      expect(response).to be_successful

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash
      data = result[:data]

      expect(data).to have_key(:id)
      expect(data[:id].to_i).to eq(customer_1.id)

      expect(data).to have_key(:type)
      expect(data[:type]).to eq("customer")

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a Hash
      attributes = data[:attributes]

      expect(attributes).to have_key(:first_name)
      expect(attributes).to have_key(:last_name)
      expect(attributes).to have_key(:email)
      expect(attributes).to have_key(:address)
      expect(attributes).to have_key(:subscriptions)

      subscriptions = attributes[:subscriptions]
      expect(subscriptions.count).to eq(3)

    end
  end
