class CreateBankSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_suppliers, id: false do |t|
      t.belongs_to :bank
      t.belongs_to :supplier

      t.timestamps
    end
  end
end
