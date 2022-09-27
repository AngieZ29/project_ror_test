class CreateBankSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_suppliers do |t|
      t.references :bank, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
