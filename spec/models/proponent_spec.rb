# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proponent do
  describe 'associations' do
    it { is_expected.to have_one(:address) }
    it { is_expected.to have_many(:phones) }
  end

  describe 'validations' do
    let(:proponent) { build(:proponent) }

    it 'valid attributes' do
      expect(proponent).to be_valid
    end

    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:birth) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_uniqueness_of(:cpf) }
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

    it 'never salary equal nil' do
      proponent.salary = nil
      expect(proponent.salary.format).to eq 'R$0,00'
    end

    it 'net salary' do
      proponent.salary = 1500.0
      proponent.discount = 500.0
      expect(proponent.net_salary.format).to eq 'R$1.000,00'
    end
  end
end
