# frozen_string_literal: true

require 'rails_helper'

# TODO: criar exemplos adicionais
RSpec.describe DiscountCalculationService, type: :model do
  describe 'valid salary' do
    describe 'first band' do
      let(:service) { described_class.new(1045) }

      it '#discount' do
        expect(service.discount).to be 78.37
      end

      it '#salary_band' do
        expect(service.salary_band).to eql 'first_band'
      end

      it '#aliquot' do
        expect(service.aliquot).to be 0.075
      end
    end

    describe 'third band' do
      let(:service) { described_class.new(3000) }

      it '#discount' do
        expect(service.discount).to be 281.62
      end

      it '#salary_band' do
        expect(service.salary_band).to eql 'third_band'
      end

      it '#aliquot' do
        expect(service.aliquot).to be 0.12
      end
    end
  end
end
