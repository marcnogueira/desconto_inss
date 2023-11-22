# frozen_string_literal: true

FactoryBot.define do
  factory :proponent do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    birth { Faker::Date.between(from: 110.years.ago, to: 1.day.ago) }
    cpf { Faker::CPF.number }
    salary { Faker::Number.decimal(l_digits: 2, r_digits: 4) }
  end
end
