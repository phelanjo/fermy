FactoryBot.define do
  factory :beer do
    name { "" }
    beer_type { "Generic" }
    description { "" }

	trait :worthy_ipa do
	  name {"Worthy"}
	  beer_type {"IPA"}
	  description{"A beer worthy of a drink"}
  	end

	trait :worthy_ipa do
	  name {"Boneyard Rojo"}
	  beer_type {"IRA"}
	  description{"A devilish drink"}
  	end
  end
end

