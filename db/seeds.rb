# Create 10 teas
10.times do
  tea = FactoryBot.create(:tea)
end

# Create 5 customers
5.times do
  customer = FactoryBot.create(:customer)
end

# Create 20 subscriptions
20.times do
  tea = FactoryBot.create(:tea)
  customer = FactoryBot.create(:customer)
  subscription = FactoryBot.create(:subscription, tea: tea, customer: customer)
end
