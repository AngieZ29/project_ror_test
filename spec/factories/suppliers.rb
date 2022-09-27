FactoryBot.define do
  factory :supplier do
    name { Faker::Name.name }
    nit { '901362343-4' }
    name_contact { Faker::Name.name }
    phone_number { '3212345678' }
    bank_account { '555666777888' }
  end
end
