class String
  def self.to_constant s
    s.to_constant
  end

  def self.upcase_first s
    s.upcase_first
  end

  def self.lowercase_first s
    s.lowercase_first
  end

  def to_constant
    self.split('::').inject(Object) { |o,c| o.const_get c }
  end

  def upcase_first
    self.slice(0,1).capitalize + self.slice(1..-1)
  end

  def lowercase_first
    self.slice(0,1).downcase + self.slice(1..-1)
  end
end