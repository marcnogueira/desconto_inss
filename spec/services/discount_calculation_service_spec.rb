require 'rails_helper'

# TODO: criar exemplos adicionais
RSpec.describe DiscountCalculationService, type: :model do
  describe 'valid salary' do

    describe 'third band' do
      let(:service) {described_class.new(3000)}

      it '#discount' do
        expect(service.discount).to eql 281.62
      end

      it '#salary_band' do
        expect(service.salary_band).to eql 'third_salary_band'
      end

      it 'aliquot' do
        expect(service.aliquot).to eql 0.12
      end
    end
  end
end