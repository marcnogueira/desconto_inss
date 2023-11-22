# frozen_string_literal: true

module FactoryHelpers
  module_function

  def complet_address
    address = "#{Faker::Address.street_name}, "
    address + Faker::Address.building_number
  end
end
