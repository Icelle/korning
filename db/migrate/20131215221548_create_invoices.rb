class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.string :frequency
      t.references :sale, index: true

      t.timestamps
    end
  end
end
