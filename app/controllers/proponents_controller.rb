# frozen_string_literal: true

class ProponentsController < ApplicationController
  def index
    @proponents = Proponent.order(:full_name).page(params[:page])
    @chart = {}
    %i[first_band second_band third_band fourth_band processing].each do |band|
      @chart[I18n.t("salary_bands.#{band}")] = Proponent.by_salary_band(band).count
    end
  end

  def new
    @proponent = Proponent.new
    @proponent.build_address
    @proponent.phones << Phone.new
  end

  def edit
    @proponent = Proponent.eager_load(:address, :phones).find(params[:id])
  end

  def update_discount
    discount_service = DiscountCalculationService.new(params[:salary])
    @discount = discount_service.discount
  end

  def create
    @proponent = Proponent.new(proponent_params)
    if @proponent.save
      redirect_to proponents_url
    else
      render :new
    end
  end

  def update
    @proponent = Proponent.find(params[:id])
    if @proponent.update(proponent_params)
      redirect_to proponents_url
    else
      render :edit
    end
  end

  def destroy
    @proponent = Proponent.find(params[:id])
    @proponent.destroy!
    redirect_to proponents_url
  end

  private

  def proponent_params
    params.require(:proponent).permit(
      :full_name, :email, :birth, :salary, :cpf,
      address_attributes: %i[
        zip_code address number complement
        neighborhood city uf
      ],
      phones_attributes: %i[
        type number
      ]
    )
  end
end
