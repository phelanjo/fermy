RSpec::Matchers.define :be_complete_ingredient do
  match do |actual|
    (!actual.name.nil? && !actual.amount.nil? && !actual.unit.nil? &&
    !actual.description.nil?)
  end

  description do
    'have all categories completed'
  end

  failure_message do |actual|
    "expected ingredient #{actual.name} to exist, was #{actual}"
    "expected ingredient #{actual}.amount to exist, was #{actual}"
    "expected ingredient #{actual}.unit to exist, was #{actual}"
    "expected ingredient #{actual}.description to exist, was #{actual}"
  end

  failure_message_when_negated do |actual|
    "expected ingredient #{actual.name} to be nil, but it did"
  end
end
