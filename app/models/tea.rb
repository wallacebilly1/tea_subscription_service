class Tea < ApplicationRecord
  validates :title, :description, presence: :true
  validates :temperature, :brew_time, presence: :true, numericality: :true
end
