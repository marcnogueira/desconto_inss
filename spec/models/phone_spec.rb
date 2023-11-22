# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone do
  describe 'associations' do
    it { is_expected.to belong_to(:proponent) }
  end

  describe 'validations' do
    let(:phone) { build(:phone) }

    it 'valid attributes' do
      expect(phone).to be_valid
    end

    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.not_to allow_values('11 23455576').for(:number) }
    it { is_expected.to validate_presence_of(:type) }
  end
end
