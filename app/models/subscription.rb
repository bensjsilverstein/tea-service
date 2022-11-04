class Subscription < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :price, greater_than_or_equal_to: 0
  validates_presence_of :status
  validates_presence_of :frequency

  belongs_to :customer
  belongs_to :tea

  enum status: [:Active, :Cancelled]
  enum frequency: [:Weekly, :Monthly]
end
