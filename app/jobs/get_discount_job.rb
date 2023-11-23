# frozen_string_literal: true

require 'rake'
Rails.application.load_tasks

class GetDiscountJob < ApplicationJob
  def perform(proponent_id)
    proponent = Proponent.find_by(id: proponent_id)

    return if proponent.nil?

    discount_service = DiscountCalculationService.new(proponent.salary)

    proponent.update!(
      discount: discount_service.discount,
      salary_band: discount_service.salary_band
    )
  end
end
