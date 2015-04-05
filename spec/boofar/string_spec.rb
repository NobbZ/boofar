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
  end
end