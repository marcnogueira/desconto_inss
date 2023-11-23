# frozen_string_literal: true

FactoryBot.define do
  factory :proponent do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    birth { Faker::Date.between(from: 110.years.ago, to: 1.day.ago) }
    cpf { Faker::CPF.number }
    salary { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    discount { 0.0 }

    trait :with_address_and_phone do
      after(:create) do |proponent|
        create(:address, proponent: proponent)
        create(:phone, proponent: proponent)
      end
    end
  end
end
