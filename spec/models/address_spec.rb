# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  describe 'associations' do
    it { is_expected.to belong_to(:proponent) }
  end

  describe 'validations' do
    let(:address) { build(:address) }

    it 'valid attributes' do
      expect(address).to be_valid
    end

    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:uf) }
    it { is_expected.to allow_values('', nil).for(:complement) }
  end
end
