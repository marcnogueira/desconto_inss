class DiscountCalculationService::BaseSalaryBand
  attr_writer :next_band

  def calculate(salary, discount)
    discount += (salary_or_range?(salary).to_f - self.band_data[:range][0]).round_down(2) * self.band_data[:aliquot]
    if last_band?(salary)
      [discount.round_down(2), self.band_data[:aliquot], class_to_string]
    else
      @next_band.calculate(salary, discount.round_down(2))
    end
  end

  private

  def salary_or_range?(salary)
    last_band?(salary) ? salary : self.band_data[:range][1]
  end

  def last_band?(salary)
    salary <= self.band_data[:range][1] || @next_band.nil?
  end
  
  def class_to_string
    self.class.to_s.underscore.split("/").last
  end
end