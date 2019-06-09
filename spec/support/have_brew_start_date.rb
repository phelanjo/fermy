RSpec::Matchers.define :have_brew_start_date do |expected|
  match do |actual|
    actual.brew_start_date == expected
  end

  description do
    "Have brewing start date of #{expected}"
  end

  failure_message do |actual|
    "Expected brewing start to be #{expected}, was #{actual}"
  end

  failure_message_when_negated do |actual|
    "Expected brewing start date not to be #{expected}, but it was"
  end
end