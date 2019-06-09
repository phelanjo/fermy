RSpec::Matchers.define :have_brew_end_date do |expected|
  match do |actual|
    actual.brew_end_date == expected
  end

  description do
    "Have brewing end date of #{expected}"
  end

  failure_message do |actual|
    "Expected brewing end date to be #{expected}, was #{actual}"
  end

  failure_message_when_negated do |actual|
    "Expected brewing end date not to be #{expected}, but it was"
  end
end