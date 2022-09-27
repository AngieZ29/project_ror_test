class SuppliersController < ApplicationController
  before_action :find_supplier, only: [:edit, :update]

  rescue_from ActiveRecord::RecordInvalid do |e|
    render partial: 'error', status: :unprocessable_entity
  end

  def index
    @suppliers = Supplier.order(:name).page params[:page]
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(val_params)

    if @supplier.save

      redirect_to suppliers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @supplier.update!(val_params)
    redirect_to suppliers_path
  end

  private

  def val_params
    params.require(:supplier).permit(:name, :nit, :name_contact, :phone_number, :bank_account,
      banks_attributes: [:id, :name])
  end

  def find_supplier
    @supplier = Supplier.find(params[:id])
  rescue
    render json: { error: "Couldn't find Supplier with 'id'=#{params[:id]}" }, status: :not_found
  end
end
