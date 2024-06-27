require 'rails_helper'

RSpec.describe Customer do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
  end

  describe 'associations' do
    it { should have_many(:subscriptions) }
    it { should have_many(:teas).through(:subscriptions) }
  end
end