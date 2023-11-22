# frozen_string_literal: true

require 'factory_bot_rails'
require 'faker'
require 'cpf_faker'

FactoryBot.create_list(:proponent, 20, :with_address_and_phone)
