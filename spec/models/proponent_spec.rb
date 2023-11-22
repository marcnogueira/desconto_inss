# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proponent do
  describe 'validations' do
    let(:proponent) { build(:proponent) }

    it 'is valid with valid attributes' do
      expect(proponent).to be_valid
    end

    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:birth) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.not_to allow_values('555.321.444-12').for(:cpf) }
    it { is_expected.not_to allow_values('ze.da.roca.com').for(:email) }

    it 'not greater than 110 years old' do
      proponent.birth = '05/10/1900'
      expect(proponent).not_to be_valid
    end

    it 'not future travelers' do
      proponent.birth = 1.month.from_now
      expect(proponent).not_to be_valid
    end
  end
end
