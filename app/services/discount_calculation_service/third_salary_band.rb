class DiscountCalculationService::ThirdSalaryBand < DiscountCalculationService::BaseSalaryBand
  def band_data
    {range: [2089.61, 3134.4], aliquot: 0.12}
  end
end