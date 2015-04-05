require 'spec_helper'

describe String do
  context :to_constant do
    { "String"          => String,
      "Class"           => Class,
      "Boofar::VERSION" => Boofar::VERSION,
      "Boofar"          => Boofar
    }.each do |k, v|
      it "should resolve '#{k}' to #{v} (instance)" do
        expect(k.to_constant).to be v
      end
      it "should resolve '#{k}' to #{v} (class)" do
        expect(String.to_constant k).to be v
      end
    end

    it { expect{"FOODLEBAR_DOES_NOT_EXISTS".to_constant}.to raise_error NotAConstant, /FOODLEBAR_DOES_NOT_EXISTS/ }
    it { expect{String.to_constant "FOODLEBAR_DOES_NOT_EXISTS"}.to raise_error NotAConstant, /FOODLEBAR_DOES_NOT_EXISTS/ }

    it { expect{"foo".to_constant}.to raise_error NotAConstant }
    it { expect{String.to_constant "foo"}.to raise_error NotAConstant }

    [ 2, :bar, ["baz"] ].each do |value|
      it { expect{String.to_constant value}.to raise_error ArgumentError }
    end
  end

  context :upcase_first do
    { "Foo" => "Foo",
      "bar" => "Bar",
      "BAZ" => "BAZ"
    }.each do |k, v|
      it "should upcase the first letter of '#{k}' to '#{v}' (instance)" do
        expect(k.upcase_first).to eql v
      end
      it "should upcase the first letter of '#{k}' to '#{v}' (class)" do
        expect(String.upcase_first k).to eql v
      end
    end

    [ 2, :bar, ["baz"] ].each do |value|
      it { expect{String.upcase_first value}.to raise_error ArgumentError }
    end
  end

  context :lowercase_first do
    { "Foo" => "foo",
      "bar" => "bar",
      "BAZ" => "bAZ"
    }.each do |k, v|
      it "should lowercase the first letter of '#{k}' to '#{v}' (instance)" do
        expect(k.lowercase_first).to eql v
      end
      it "should lowercase the first letter of '#{k}' to '#{v}' (class)" do
        expect(String.lowercase_first k).to eql v
      end
    end

    [ 2, :bar, ["baz"] ].each do |value|
      it { expect{String.lowercase_first value}.to raise_error ArgumentError }
    end
  end
end