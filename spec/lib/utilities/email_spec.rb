# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Utilities::Email, type: :model do
  describe '#valid?' do
    let(:valid_email) { 'john.doe@example.net' }
    let(:invalid_email) { 'jose_da_roca.com' }

    it 'with valid email' do
      expect(
        described_class.valid?(valid_email)
      ).to be true
    end

    it 'with invalid email' do
      expect(
        described_class.valid?(invalid_email)
      ).to be false
    end
  end

  describe '#masked' do
    let(:valid_email) { 'john.doe@example.net' }
    let(:invalid_email) { 'jose_da_roca.com' }

    it 'generate mask for a valid email' do
      expect(
        described_class.masked(valid_email)
      ).to eql 'jo****oe@example.net'
    end

    it 'generate error for a invalid email' do
      expect do
        described_class.masked(invalid_email)
      end.to raise_error(StandardError)
    end
  end
end
