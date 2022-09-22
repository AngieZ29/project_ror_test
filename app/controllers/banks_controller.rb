class BanksController < ApplicationController
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

  private

  def val_params
    params.require(:bank).permit(:name)
  end
end
