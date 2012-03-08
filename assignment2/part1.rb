# metaprogramming to the rescue!

class Numeric
  @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(currency)
    self == 0 and 0.0 or (1 / (1 / self).send(currency))
  end
end

class String
  def palindrome?
    string = self.gsub(/\W/,'').downcase
    string == string.reverse
  end
end

module Enumerable
  def palindrome?
    self.each.zip(self.reverse_each).map { |a,b| a == b }.all?
  end
end
