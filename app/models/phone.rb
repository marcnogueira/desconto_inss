# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :proponent

  validates :number, presence: true, phone: true
  validates :type, presence: true
end
