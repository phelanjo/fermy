RSpec::Matchers.define :be_complete do |expected|
  match do |actual|
    !actual.name.nil? && !actual.amount.nil? && !actual.unit.nil? && !actual.description.nil?
  end

  description do
    "have all categories completed #{expected}"
  end

  failure_message do |actual|
    "expected ingredient #{actual.name} to have #{expected}, was #{actual}"
  end

  failure_message_when_negated do |actual|
    "expected ingredient #{actual.name} not to have #{expected}, but it did"
  end
end
