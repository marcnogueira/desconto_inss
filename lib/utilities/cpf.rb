# frozen_string_literal: true

module Utilities
  class Cpf
    class << self
      def valid?(cpf)
        cpf = only_numbers cpf

        return false if cpf.length != 11

        vd1 = calculate_vd(9, cpf)
        vd2 = calculate_vd(10, cpf)

        cpf[9..10] == "#{vd1}#{vd2}"
      end

      def masked(cpf)
        raise StandardError unless valid?(cpf)

        "***.***.**#{cpf.to_s[8]}-#{cpf.to_s[9..10]}"
      end

      def only_numbers(cpf)
        return '' if cpf.nil?

        cpf.gsub(/\D/, '')
      end

      def calculate_vd(number, cpf)
        sum = 0
        number = number.to_i
        number.times do |i|
          sum += cpf[i].to_i * ((number + 1) - i)
        end
        remainder = sum % 11
        remainder < 2 ? 0 : 11 - remainder
      end

      def formatted(cpf)
        raise StandardError unless valid?(cpf)

        cpf = only_numbers(cpf).to_s
        "#{cpf[0..2]}.#{cpf[3..5]}.#{cpf[6..8]}-#{cpf[9..10]}"
      end
    end
  end
end
