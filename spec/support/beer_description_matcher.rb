RSpec::Matchers.define :have_beer_description do |expected|
  match do |actual|
    actual.description == expected
  end

  description do
    "have a beer with a description #{expected}"
  end

  failure_message do |actual|
    "expected beer #{actual.name} to have description #{expected}, was #{actual}"
  end

  failure_message_when_negated do |actual|
    "expected beer #{actual.name} not to have description #{expected}, but it did"
  end
end
