# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    zip_code      { Faker::Address.zip_code }
    address       { Faker::Address.street_name }
    number        { Faker::Address.building_number }
    complement    { Faker::Address.secondary_address }
    neighborhood  { Faker::Address.neighborhood }
    city          { Faker::Address.city }
    uf            { Faker::Address.state_abbr }
    proponent
  end
end
