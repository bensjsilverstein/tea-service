require 'rails_helper'


RSpec.describe 'Create a Subcscription Page' do

  describe 'Creating a new subscription' do

    it "can create a new tea subscription" do
      customer_1 = Customer.create!(first_name: "Ben", last_name: "S", email: "BenS@email.email", address: "123 Sesame St")
      customer_2 = Customer.create!(first_name: "Greg", last_name: "P", email: "GP@email.email", address: "234 Sesame St")

      tea_1 = Tea.create!(title: "Green", description: "It's green.", temperature: 111, brew_time: "1 minute")
      tea_2 = Tea.create!(title: "Black", description: "It's black.", temperature: 112, brew_time: "2 minutes")
      tea_3 = Tea.create!(title: "Orange Blossom", description: "It's ORANGE.", temperature: 113, brew_time: "3 minutes")
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        customer_id: customer_1.id,
        tea_id: tea_1.id,
        price: 3.50,
        frequency: 0,
        status: 0
      }

      post '/api/v1/subscribe', headers: headers, params: JSON.generate(payload)
      expect(response).to be_successful
      expect(response.status).to eq 201

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash

      data = result[:data]
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a String

      expect(data).to have_key(:type)
      expect(data[:type]).to be_a String
      expect(data[:type]).to eq("subscription")

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a Hash

      attributes = data[:attributes]
      expect(attributes).to have_key(:title)
      expect(attributes[:title]).to be_a String

      expect(attributes).to have_key(:price)
      expect(attributes[:price]).to be_a Float

      expect(attributes).to have_key(:status)
      expect(attributes[:status]).to eq("Active")

      expect(attributes).to have_key(:frequency)
      expect(attributes[:frequency]).to eq("Weekly")

      expect(attributes[:customer_id]).to eq(customer_1.id)
      expect(attributes[:tea_id]).to eq(tea_1.id)
    end
  end
end
