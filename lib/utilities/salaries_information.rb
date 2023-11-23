# frozen_string_literal: true

module Utilities
  class SalariesInformation
    RANGES = {
      first_band: { name: 'first_band', range: [0, 1045.0], aliquot: 0.075 },
      second_band: { name: 'second_band', range: [1045.01, 2089.60], aliquot: 0.09 },
      third_band: { name: 'third_band', range: [2089.61, 3134.4], aliquot: 0.12 },
      fourth_band: { name: 'fourth_band', range: [3134.41, 6101.06], aliquot: 0.14 }
    }.freeze
  end
end
