class BankSupplier < ApplicationRecord
  belongs_to :bank
  belongs_to :supplier

  validates :bank, :supplier, presence: true
end
