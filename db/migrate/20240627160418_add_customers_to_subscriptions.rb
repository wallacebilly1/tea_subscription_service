class AddCustomersToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_reference :subscriptions, :customer, null: false, foreign_key: true
  end
end
