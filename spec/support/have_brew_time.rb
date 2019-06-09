RSpec::Matchers.define :have_brewing_time do |expected|
  match do |actual|
    actual.brewing_time == expected
  end

  description do
    "Have brewing time of #{expected} days"
  end

  failure_message do |actual|
    "Expected brewing time to be #{expected} days, was #{actual} days"
  end

  failure_message_when_negated do |actual|
    "Expected brewing time not to be #{expected} days, but it was"
  end
end