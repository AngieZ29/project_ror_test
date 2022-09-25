class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :nit
      t.string :name_contact
      t.string :phone_number
      t.string :bank_account

      t.timestamps
    end
  end
end
