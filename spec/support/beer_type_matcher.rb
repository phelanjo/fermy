RSpec::Matchers.define :be_of_beer_type do |expected|
  match do |actual|
    actual.beer_type == expected
  end

  description do
    "have a beer type of #{expected}"
  end
end
