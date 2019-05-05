RSpec::Matchers.define :have_beer_description do |expected|
  match do |actual|
    actual.description == expected
  end
end
