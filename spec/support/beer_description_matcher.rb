RSpec::Matchers.define :have_beer_description do |expected|
  match do |actual|
    actual.description == expected
  end

  description do
    "have a beer with a description #{expected}"
  end
end
