# frozen_string_literal: true

module DiscountCalculationService
  class FirstSalaryBand < DiscountCalculationService::BaseSalaryBand
    def band_data
      { range: [0, 1045.0], aliquot: 0.075 }
    end
  end
end
