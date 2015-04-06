# A `RuntimeError` thrown when a given {String} can't get transformed into a constant
#
# @since 0.0.1
# @author Norbert Melzer <timmelzer@gmail.com>
class NotAConstant < RuntimeError
end

# Some helpers defined into stdlibs {String}-class
#
# @since 0.0.1
# @author Norbert Melzer <timmelzer@gmail.com>
class String
  # Creates a constant from a {String}
  #
  # @param s [String] The {String} that shall be converted to a constant
  # @return A constant equivalent to the given {String} `s`
  # @raise [ArgumentError] When `s` is not a {String}
  # @since 0.0.1
  # @author Norbert Melzer <timmelzer@gmail.com>
  def self.to_constant s
    if s.is_a? String then
      s.to_constant
    else
      raise ArgumentError.new "String expected, got #{s.class}"
    end
  end

  # Makes the first character of a {String} upcase
  #
  # @param s [String] The {String} that shall get modified
  # @return [String] `s` with the first character uppercased
  # @raise [ArgumentError] When `s` is not a {String}
  # @since 0.0.1
  # @author Norbert Melzer <timmelzer@gmail.com>
  def self.upcase_first s
    if s.is_a? String then
      s.upcase_first
    else
      raise ArgumentError.new "String expected, got #{s.class}"
    end
  end

  # Makes the first character of a {String} lowercase
  #
  # @param s [String] The {String} that shall get modified
  # @return [String] `s` with the first character lowercased
  # @raise [ArgumentError] When `s` is not a {String}
  # @since 0.0.1
  # @author Norbert Melzer <timmelzer@gmail.com>
  def self.lowercase_first s
    if s.is_a? String then
      s.lowercase_first
    else
      raise ArgumentError.new "String expected, got #{s.class}"
    end
  end

  # Creates a constant from a {String}
  #
  # @return A constant equivalent to the given {String} `s`
  # @since 0.0.1
  # @author Norbert Melzer <timmelzer@gmail.com>
  def to_constant
    begin
      self.split('::').inject(Object) { |o,c| o.const_get c }
    rescue NameError => e
      raise NotAConstant.new "#{self} is not a valid constant"
    end
  end

  # Makes the first character of a {String} upcase
  #
  # @return [String] `s` with the first character uppercased
  # @since 0.0.1
  # @author Norbert Melzer <timmelzer@gmail.com>
  def upcase_first
    self.slice(0,1).capitalize + self.slice(1..-1)
  end

  # Makes the first character of a {String} lowercase
  #
  # @return [String] `s` with the first character uppercased
  # @since 0.0.1
  # @author Norbert Melzer <timmelzer@gmail.com>
  def lowercase_first
    self.slice(0,1).downcase + self.slice(1..-1)
  end
end