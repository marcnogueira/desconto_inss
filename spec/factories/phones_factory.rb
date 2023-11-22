# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    number { Faker::PhoneNumber.phone_number_with_country_code }
    type { 'CelularPhone' }
    proponent
  end
end
