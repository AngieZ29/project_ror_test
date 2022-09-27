require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do
  describe 'GET#index' do
    context 'when there is not data' do
      it 'should return nil' do
        get :index
        expect(response.body).to be_empty
      end
    end

    context 'when there is data' do
      let!(:supplier) { create(:supplier) }

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end

      it 'responds successfully' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST#create' do
    context 'when the name field is correct' do
      req_supplier =
        { supplier:
          { name: Faker::Name.name, nit: '901234567-2', name_contact: Faker::Name.name,
            phone_number: '30256789124', bank_account: '555666777888999' } }

      it 'should return fields created' do
        post :create, params: req_supplier
        expect(assigns(:supplier).name).to eq(req_supplier[:supplier][:name])
        expect(assigns(:supplier).nit).to eq(req_supplier[:supplier][:nit])
        expect(assigns(:supplier).name_contact).to eq(req_supplier[:supplier][:name_contact])
        expect(assigns(:supplier).phone_number).to eq(req_supplier[:supplier][:phone_number])
        expect(assigns(:supplier).bank_account).to eq(req_supplier[:supplier][:bank_account])
      end
    end

    context 'when there is not data' do
      req_supplier =
        { supplier:
          { name: nil, nit: nil, name_contact: nil, phone_number: nil, bank_account: nil } }

      it 'should return nil' do
        post :create, params: req_supplier
        expect(assigns[:name]).to eq(nil)
        expect(assigns[:nit]).to eq(nil)
        expect(assigns[:name_contact]).to eq(nil)
        expect(assigns[:phone_number]).to eq(nil)
        expect(assigns[:bank_account]).to eq(nil)
      end
    end
  end

  describe 'PUT#update' do
    let!(:supplier) { create(:supplier) }

    context 'when the name value is updated' do
      before do
        put :update,
          params:
            { id: supplier.id,
              supplier:
                { name: 'Franco Porras', nit: '901234567-2', name_contact: 'Laura Torres',
                  phone_number: '3025678914', bank_account: '55566677788899' } }
      end

      it 'should redirect to index' do
        expect(response).to redirect_to(suppliers_path)
      end

      it 'should return the name field updated' do
        expect(assigns(:supplier).name).to eq('Franco Porras')
        expect(assigns(:supplier).nit).to eq('901234567-2')
        expect(assigns(:supplier).name_contact).to eq('Laura Torres')
        expect(assigns(:supplier).phone_number).to eq('3025678914')
        expect(assigns(:supplier).bank_account).to eq('55566677788899')
      end
    end

    context 'when the name value is not updated' do
      before do
        put :update, params: { id: 'x', supplier: { name: 'Franco Porras' } }
      end

      it 'should return not_found' do
        expect(JSON.parse(response.body)['error']).to eq("Couldn't find Supplier with 'id'=x")
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE#destroy' do
    let!(:supplier) { create(:supplier) }

    context 'when the row is deleted' do
      before do
        delete :destroy, params: { id: supplier.id }
      end

      it 'should return id supplier' do
        expect(assigns(:supplier).id).to eq(supplier.id)
      end

      it 'should redirect to index' do
        expect(response).to redirect_to(suppliers_path)
      end
    end

    context 'when the row is not deleted' do
      before do
        delete :destroy, params: { id: 'x' }
      end

      it 'should return not_found' do
        expect(JSON.parse(response.body)['error']).to eq("Couldn't find Supplier with 'id'=x")
      end
    end
  end
end
