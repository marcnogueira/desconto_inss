# frozen_string_literal: true

module Utilities
  class Email
    class << self
      def valid?(email)
        email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i ? true : false
      end

      def masked(email)
        raise StandardError unless valid?(email)

        parts = email.split('@')
        first_size = parts[0].size
        "#{parts[0][0..1]}#{'*' * (first_size - 4)}#{parts[0][(first_size - 2)..(first_size - 1)]}@#{parts[1]}"
      end
    end
  end
end
