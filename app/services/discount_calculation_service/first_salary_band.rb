class DiscountCalculationService::FirstSalaryBand < DiscountCalculationService::BaseSalaryBand

  def band_data
    {range: [0, 1045.0], aliquot: 0.075}
  end
end