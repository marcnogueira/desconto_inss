# frozen_string_literal: true

module Utilities
  class Phone
    class << self
      def valid?(phone)
        return '' if phone.blank?

        phone = formatted(phone)
        phone_pattern = /\A\+\d{1,3}\s\(\d{2,3}\)\s\d{4,5}-\d{4}\z/
        phone.match(phone_pattern) ? true : false
      end

      def only_numbers(phone)
        return '' if phone.blank?

        phone.gsub(/\D/, '')
      end

      def formatted(phone)
        return '' if phone.blank?

        phone = only_numbers(phone)

        country_code = phone[0..1]
        ddd = phone[2..3]
        number = phone[4..]

        return "+#{country_code} (#{ddd}) #{number[0..3]}-#{number[4..]}" unless number.length >= 9

        part1 = number[0..4]
        part2 = number[5..]
        "+#{country_code} (#{ddd}) #{part1}-#{part2}"
      end
    end
  end
end
