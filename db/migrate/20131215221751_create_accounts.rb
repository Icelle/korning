class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :number
      t.references :customer, index: true

      t.timestamps
    end
  end
end
