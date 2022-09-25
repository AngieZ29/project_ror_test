class Bank < ApplicationRecord
  has_and_belongs_to_many :supplier
  validates :name, length: { maximum: 50 }, presence: true
end
