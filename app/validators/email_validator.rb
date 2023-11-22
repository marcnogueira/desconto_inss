# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if Utilities::Email.valid?(value)

    record.errors.add attribute, (options[:message] || 'nao e um email valido')
  end
end
