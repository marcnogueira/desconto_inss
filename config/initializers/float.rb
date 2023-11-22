# frozen_string_literal: true

class Float
  def round_down(number = 0)
    s = to_s
    l = s.index('.') + 1 + number
    s.length <= l ? self : s[0, l].to_f
  end
end
