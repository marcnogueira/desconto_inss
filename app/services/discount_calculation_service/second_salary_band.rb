class DiscountCalculationService::SecondSalaryBand < DiscountCalculationService::BaseSalaryBand
  def band_data
    {range: [1045.01, 2089.60], aliquot: 0.09}
  end
end