class Bank < ApplicationRecord
  has_many :bank_suppliers
  has_many :suppliers, through: :bank_suppliers

  validates :name, length: { maximum: 50 }, presence: true
end
