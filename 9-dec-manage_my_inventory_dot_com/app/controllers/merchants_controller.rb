class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.new(params[:merchant])

    if @merchant.save
      redirect_to root_path, notice: "Merchant was created"
    else
      render :new
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])

    if @merchant.update_attributes(params[:merchant])
      redirect_to root_path, notice: "Merchant was updated"
    else
      render :edit
    end
  end
end
