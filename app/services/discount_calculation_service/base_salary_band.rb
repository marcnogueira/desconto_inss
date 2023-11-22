# frozen_string_literal: true

module DiscountCalculationService
  class BaseSalaryBand
    attr_writer :next_band

    def calculate(salary, discount)
      discount += (salary_or_range?(salary) - band_data[:range][0]).round_down(2) * band_data[:aliquot]
      if last_band?(salary)
        [discount.round_down(2), band_data[:aliquot], class_to_string]
      else
        @next_band.calculate(salary, discount.round_down(2))
      end
    end

    private

    def salary_or_range?(salary)
      last_band?(salary) ? salary : band_data[:range][1]
    end

    def last_band?(salary)
      salary <= band_data[:range][1] || @next_band.nil?
    end

    def class_to_string
      self.class.to_s.underscore.split('/').last
    end
  end
end
