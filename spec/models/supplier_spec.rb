require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe 'validate fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:name_contact) }
    it { should validate_length_of(:phone_number).is_at_most(10) }
    it { should validate_length_of(:bank_account).is_at_most(15) }
  end

  describe 'validate nit field' do
    let(:nit_regex) { /\A((\d){9}(-)(\d){1})\z/ }
    let!(:supplier) { create(:supplier) }

    req_supplier =
      { supplier:
        { nit: 'x901234567-2', phone_number: '+5730256789124', bank_account: '555666777888999x' } }

    context 'when is the nit valid' do
      let!(:supplier) { create(:supplier) }

      it 'should return true' do
        expect(supplier.nit).to match(nit_regex)
      end
    end

    context 'when is not the nit valid' do
      it 'should return false' do
        expect(req_supplier[:supplier][:nit]).not_to match(nit_regex)
      end
    end
  end
end
