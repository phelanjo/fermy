RSpec::Matchers.define :be_of_beer_type do |expected|
  match do |actual|
    actual.beer_type == expected
  end

  description do
    "have a beer type of #{expected}"
  end

  failure_message do |actual|
    "expected to be beer type #{expected}, was #{actual}"
  end

  failure_message_when_negated do |acutal|
    "expected beer #{actual.name} not to be of type #{expected}, but it was"
  end
end
