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
    end
  end
end
