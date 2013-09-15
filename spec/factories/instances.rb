# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :instance do
    role "MyString"
    region "MyString"
    hostname "MyString"
    ec2_public_hostname "MyString"
    ssh_key "MyString"
  end
end
