# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Utilities::Phone, type: :model do
  describe '#valid?' do
    let(:valid_phone) { '551112345678' }
    let(:valid_phone_formatted) { '+55 (11) 1234-5678' }
    let(:invalid_phone) { '(11) 92345-6789' }

    it 'with valid phone' do
      expect(
        described_class.valid?(valid_phone)
      ).to be true
    end

    it 'with valid formatted phone' do
      expect(
        described_class.valid?(valid_phone_formatted)
      ).to be true
    end

    it 'with invalid phone' do
      expect(
        described_class.valid?(invalid_phone)
      ).to be false
    end

    it 'with invalid lenght phone' do
      expect(
        described_class.valid?('267518328')
      ).to be false
    end
  end

  describe '#formatted' do
    let(:valid_phone) { '551112345678' }
    let(:valid_phone_formatted) { '+55 (11) 1234-5678' }
    let(:valid_celular) { '5511123455678' }
    let(:valid_celular_formatted) { '+55 (11) 12345-5678' }
    let(:invalid_phone) { '26755552885' }

    it 'format a valid phone' do
      expect(
        described_class.formatted(valid_phone)
      ).to eql valid_phone_formatted
    end

    it 'format a formatted valid phone' do
      expect(
        described_class.formatted(valid_phone_formatted)
      ).to eql valid_phone_formatted
    end

    it 'format a valid celular' do
      expect(
        described_class.formatted(valid_celular)
      ).to eql valid_celular_formatted
    end

    it 'format a formatted valid celular' do
      expect(
        described_class.formatted(valid_celular_formatted)
      ).to eql valid_celular_formatted
    end
  end
end
