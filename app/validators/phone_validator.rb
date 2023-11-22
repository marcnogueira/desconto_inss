# frozen_string_literal: true

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if Utilities::Phone.valid?(value)
    return nil if value.blank?

    record.errors.add attribute, (options[:message] || 'nao é valido')
  end
end
