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
end
