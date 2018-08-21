FactoryBot.define do
  factory :monster do
    name { 'MyString' }
    is_quarry { false }
    is_nemesis { false }
    is_unique { false }
    expansion_id { 1 }
  end
end
