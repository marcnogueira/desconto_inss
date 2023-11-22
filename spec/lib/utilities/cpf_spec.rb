# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Utilities::Cpf, type: :model do
  describe '#valid?' do
    let(:valid_cpf) { '26751832885' }
    let(:valid_cpf_formatted) { '267.518.328-85' }
    let(:invalid_cpf) { '26755552885' }

    it 'with valid cpf' do
      expect(
        described_class.valid?(valid_cpf)
      ).to be true
    end

    it 'with valid formatted cpf' do
      expect(
        described_class.valid?(valid_cpf_formatted)
      ).to be true
    end

    it 'with invalid cpf' do
      expect(
        described_class.valid?(invalid_cpf)
      ).to be false
    end

    it 'with invalid lenght cpf' do
      expect(
        described_class.valid?('267518328')
      ).to be false
    end
  end

  describe '#masked' do
    let(:valid_cpf) { '26751832885' }
    let(:invalid_cpf) { '26755552885' }

    it 'generate mask for a valid cpf' do
      expect(
        described_class.masked(valid_cpf)
      ).to eql '***.***.**8-85'
    end

    it 'generate error for a invalid cpf' do
      expect do
        described_class.masked(invalid_cpf)
      end.to raise_error(StandardError)
    end
  end

  describe '#formatted' do
    let(:valid_cpf) { '26751832885' }
    let(:valid_cpf_formatted) { '267.518.328-85' }
    let(:invalid_cpf) { '26755552885' }

    it 'format a valid cpf' do
      expect(
        described_class.formatted(valid_cpf)
      ).to eql valid_cpf_formatted
    end

    it 'format a formatted valid cpf' do
      expect(
        described_class.formatted(valid_cpf_formatted)
      ).to eql valid_cpf_formatted
    end

    it 'generate error for a invalid cpf' do
      expect do
        described_class.formatted(invalid_cpf)
      end.to raise_error(StandardError)
    end
  end
end
