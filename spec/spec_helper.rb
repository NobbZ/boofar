$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'boofar'

RSpec.configure do |c|
  c.expect_with :rspec do |exp|
    exp.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  c.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  c.profile_examples = 5
  c.order = :random
  Kernel.srand c.seed
end