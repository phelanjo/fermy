RSpec::Matchers.define :have_name do |expected|
  match do |actual|
    actual.name == expected
  end
end
