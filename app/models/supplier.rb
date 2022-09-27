class Supplier < ApplicationRecord
  has_many :bank_suppliers
  has_many :banks, through: :bank_suppliers

  accepts_nested_attributes_for :banks, reject_if: :all_blank

  validates :name, :name_contact, :bank_account, presence: true
  validates :nit, format: { with: /(\A((\d){9}(-)(\d){1})\z)?/ }
  validates :phone_number, length: { maximum: 10 }
  validates :bank_account, length: { maximum: 15 }
  validates_uniqueness_of :bank_account, message: ': Cuenta de Banco ya existe'

  # kamimari paginacion
  paginates_per 10

  before_save :set_default_value

  def banks_attributes=banks_attributes
    banks_attributes.values.each do |bank|
      if !bank['id'].empty?
        self.banks << Bank.find_or_create_by(id: bank['id'])
      end
    end
  end

  def set_default_value
    self.nit ||= 'Sin información en la tabla'
    self.phone_number ||= 'Sin info'
  end
end
