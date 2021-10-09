require 'bcrypt'

FactoryBot.define do
  password = SecureRandom.hex(8)
  
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { password }
    encrypted_password { BCrypt::Password.create(password) }
  end
end
