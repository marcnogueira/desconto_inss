# frozen_string_literal: true

class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if Utilities::Cpf.valid?(value)

    record.errors.add attribute, (options[:message] || 'não é valido')
  end
end
