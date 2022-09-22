class BanksController < ApplicationController
  before_action :find_bank, only: [:show, :edit, :update]

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    @banks = Bank.all
  end

  def new
    @bank = Bank.new
  end

  def create
    if (@bank = Bank.create(val_params))
      redirect_to banks_path
    else
      render :create
    end
  end

  def show
  end

  def edit
  end

  def update
    @bank.update!(val_params)
    redirect_to banks_path
  end

  private

  def val_params
    params.require(:bank).permit(:name)
  end

  def find_bank
    @bank = Bank.find(params[:id])
  rescue
    render json: { error: "Couldn't find Bank with 'id'=#{params[:id]}" }, status: :not_found
  end
end
