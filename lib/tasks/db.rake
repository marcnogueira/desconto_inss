# frozen_string_literal: true

require_relative '../../app/services/discount_calculation_service/chained_calculation'

namespace :db do
  desc 'Atualiza o desconto do inss em todos proponentes'
  task update_all_proponents_discount: :environment do
    Proponent.find_each do |proponent|
      GetDiscountJob.perform_now(proponent.id)
    end
  end

  desc 'Atualiza o desconto do inss em os proponentes em processamento'
  task update_processing_proponent_discount: :environment do
    Proponent.in_process.each do |proponent|
      GetDiscountJob.perform_now(proponent.id)
    end
  end
end
