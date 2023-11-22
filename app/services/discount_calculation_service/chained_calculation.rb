# frozen_string_literal: true

class DiscountCalculationService
  class ChainedCalculation
    attr_writer :next_band

    def initialize(band_data)
      @band_data = band_data
    end

    def calculate(salary, discount = 0.0)
      discount += (salary_or_range?(salary) - @band_data[:range][0]).round_down(2) * @band_data[:aliquot]
      if last_band?(salary)
        [discount.round_down(2), @band_data[:aliquot], @band_data[:name]]
      else
        @next_band.calculate(salary, discount.round_down(2))
      end
    end

    private

    def salary_or_range?(salary)
      last_band?(salary) ? salary : @band_data[:range][1]
    end

    def last_band?(salary)
      salary <= @band_data[:range][1] || @next_band.nil?
    end
  end
end
