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

      it 'should return' do
        get :index
        expect(assigns(:supplier)).to eq([supplier])
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
end
