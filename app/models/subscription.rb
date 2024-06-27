class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum status: ["active", "cancelled"]

  validates :title, :price, :status, :frequency, :customer_id, :tea_id, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :frequency, numericality: { greater_than: 0, less_than: 13 }
  validates :tea_id, uniqueness: {scope: :customer_id}
end