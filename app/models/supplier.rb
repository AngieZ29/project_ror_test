class Supplier < ApplicationRecord
  has_and_belongs_to_many :bank
  validates :name, :name_contact, presence: true
  validates :nit, format: { with: /\A((\d){9}(-)(\d){1})\z/ }
  validates :phone_number, length: { maximum: 10 }
  validates :bank_account, length: { maximum: 15 }
end
