require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid params' do
    user = create(:user)
    expect(user).to be_valid
  end

  context 'Validators' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
  
  context 'Raise errors' do
    it 'raise error without name' do
      expect{ create(:user, name: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end
    it 'match message error without name' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'raise error without email' do
      expect{ create(:user, email: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank")
    end
    it 'match message error without email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'raise error without password' do
      expect{ create(:user, password: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Password can't be blank")
    end
    it 'match message error without password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
