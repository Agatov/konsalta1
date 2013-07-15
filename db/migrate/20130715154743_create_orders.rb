class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :username
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
