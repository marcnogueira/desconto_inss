class DiscountCalculationService::FourthSalaryBand < DiscountCalculationService::BaseSalaryBand

  def band_data
    {range: [3134.41, 6101.06], aliquot: 0.12}
  end
end