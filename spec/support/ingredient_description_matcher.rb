RSpec::Matchers.define :have_ingredient_description do |exoected|
  match do |actual|
    actual.description == expected
  end

  description do
    "ingredient has description #{expected}"
  end

  failure_message do |actual|
    "expected ingredient #{actual.name} to have description #{expected}, was #{actual}"
  end

  failure_message_when_negated do |actual|
    "expected ingredient #{actual.name} not to have description #{expected}, but it did"
  end
end
