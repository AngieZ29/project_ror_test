class SuppliersController < ApplicationController
  def index
    @supplier = Supplier.all
    render json: @supplier
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(val_params)

    if @supplier.save && !val_params['banks_attributes']['0']['id'].empty?

      redirect_to suppliers_path
    else
      render :new
    end
  end

  private

  def val_params
    params.require(:supplier).permit(:name, :nit, :name_contact, :phone_number, :bank_account,
      banks_attributes: [:id, :name])
  end
end
