require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  describe 'GET#index' do
    context 'when there is not data' do
      it 'should return nil' do
        get :index
        expect(response.body).to be_empty
      end
    end

    context 'when there is data' do
      let!(:bank) { create(:bank) }

      it 'should return' do
        get :index
        expect(assigns(:banks)).to eq([bank])
      end

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
      req_bank = { bank: { name: Faker::Bank.name } }

      it 'should return name bank' do
        post :create, params: req_bank
        expect(assigns(:bank).name).to eq(req_bank[:bank][:name])
      end
    end

    context 'when there is not data' do
      req_bank = { bank: { name: nil } }

      it 'should return nil' do
        post :create, params: req_bank
        expect(assigns[:name]).to eq(nil)
      end
    end
  end

  describe 'PUT#update' do
    let!(:bank) { create(:bank) }

    context 'when the name value is updated' do
      before do
        put :update, params: { id: bank.id, bank: { name: 'New Bank' } }
      end

      it 'should redirect to index' do
        expect(response).to redirect_to(banks_path)
      end

      it 'should return the name field updated' do
        expect(assigns(:bank).name).to eq('New Bank')
      end
    end

    context 'when the name value is not updated' do
      before do
        put :update, params: { id: 'x', bank: { name: 'New Bank' } }
      end

      it 'should return not_found' do
        expect(JSON.parse(response.body)['error']).to eq("Couldn't find Bank with 'id'=x")
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when the name value is not updated' do
      before do
        put :update, params: { id: bank.id, bank: { name: nil } }
      end

      it 'should return not_found' do
        expect(response).to render_template(:partial => '_error')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE#destroy' do
    let!(:bank) { create(:bank) }

    context 'when the row is deleted' do
      before do
        delete :destroy, params: { id: bank.id }
      end

      it 'should return id bank' do
        expect(assigns(:bank).id).to eq(bank.id)
      end

      it 'should redirect to index' do
        expect(response).to redirect_to(banks_path)
      end
    end

    context 'when the row is not deleted' do
      before do
        delete :destroy, params: { id: 'x' }
      end

      it 'should return not_found' do
        expect(JSON.parse(response.body)['error']).to eq("Couldn't find Bank with 'id'=x")
      end
    end
  end
end
