RSpec::Matchers.define :be_of_beer_type do |expected|
  match do |actual|
    actual.beer_type == expected
  end
end
