# frozen_string_literal: true

class BirthValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if valid_birth_date?(value)

    record.errors.add attribute, (options[:message] || 'data de nascimento fora do range')
  end

  def valid_birth_date?(birth)
    birth.present? && birth < 1.day.ago && birth > 120.years.ago
  end
end
