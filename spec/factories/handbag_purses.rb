# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :handbag_purse, :class => 'Purse' do
    purseholder_type "MyString"
    purseholder_id 1
    token "MyString"
    locked false
  end
end
