require 'rails_helper'


RSpec.describe 'Create a Subcscription Page' do

  describe 'Creating a new subscription' do
    # validates_presence_of :title
    # validates_presence_of :description
    # validates_presence_of :temperature
    # validates_presence_of :brew_time

    # t.string :title
    # t.float :price
    # t.string :status, default: "Active"
    # t.string :frequency
    # t.references :tea, foreign_key: true
    # t.references :customer, foreign_key: true

    it "has a link that redirects me to a form to add a new bulk discount" do
      customer_1 = Customer.create!(first_name: "Ben", last_name: "S", email: "BenS@email.email", address: "123 Sesame St")
      customer_2 = Customer.create!(first_name: "Greg", last_name: "P", email: "GP@email.email", address: "234 Sesame St")

      tea_1 = Tea.create!(title: "Green", description: "It's green.", temperature: 111, brew_time: "1 minute")
      tea_2 = Tea.create!(title: "Black", description: "It's black.", temperature: 112, brew_time: "2 minutes")
      tea_3 = Tea.create!(title: "Orange Blossom", description: "It's ORANGE.", temperature: 113, brew_time: "3 minutes")


    end

    it "fill out the form and am redirected to the index where the new discount is shown" do

    end

  end

end
