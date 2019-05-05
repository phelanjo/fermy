RSpec::Matchers.define :be_of_beer_type do |expected|
  match do |actual|
    actual.beer_type == expected
  end

  description do
    "have a beer type of #{expected}"
  end

  failure_message do |actual|
    "expected project #{actual.beer_type} to be beer type #{expect}, was #{actual}"
  end
end
