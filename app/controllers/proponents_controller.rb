# frozen_string_literal: true

class ProponentsController < ApplicationController
  def index
    @proponents = Proponent.order(:full_name).page(params[:page])
    @chart = Hash.new
    %i(first_band second_band third_band fourth_band processing).each do |band|
      @chart[I18n.t("salary_bands.#{band.to_s}")] = Proponent.by_salary_band(band).count
    end
  end

  def new
    @proponent = Proponent.new
    @proponent.build_address
    @proponent.phones << Phone.new
  end

  def edit
    @proponent = Proponent.find(id)
  end
  
  def create
    
  end

  def update; end

  private

  def proponent_attrs

  end
end
