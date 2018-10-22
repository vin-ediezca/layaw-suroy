require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User validation test' do

    it 'Ensures first_name presence' do
      user = User.new(last_name: 'Last', email: 'email1234@email.com', password: '12345678', password_confirmation: '12345678', role: 'editor').save
      expect(user).to eq(false)
    end

    it 'Ensures last_name presence' do
      user = User.new(first_name: 'First', email: 'email1234@email.com', password: '12345678', password_confirmation: '12345678', role: 'editor').save
      expect(user).to eq(false)
    end

    it 'Ensures email presence' do
      user = User.new(first_name: 'First', last_name: 'Last', password: '12345678', password_confirmation: '12345678', role: 'editor').save
      expect(user).to eq(false)
    end

    it 'Ensures password presence' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'email1234@email.com', password_confirmation: '12345678', role: 'editor').save
      expect(user).to eq(false)
    end

    it 'Ensures password_confirmation presence' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'email1234@email.com', password: '12345678', role: 'editor').save
      expect(user).to eq(false)
    end

    it 'Ensures role presence' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'email1234@email.com', password: '12345678', password_confirmation: '12345678').save
      expect(user).to eq(false)
    end

    it 'Ensures password and password_confirmation match' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'email1234@email.com', password: '12345678', password_confirmation: '123456789', role: 'editor').save
      expect(user).to eq(false)
    end

    it 'Ensures password length' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'email1234@email.com', password: '1234567', password_confirmation: '1234567', role: 'editor').save
      expect(user).to eq(false)
    end

    it 'Ensures save sucessfully' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'email1234@email.com', password: '12345678', password_confirmation: '12345678', role: 'editor').save
      expect(user).to eq(true)
    end

  end
end
