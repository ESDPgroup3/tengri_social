# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without phone' do
    user = User.new(password: '123456789', password_confirmation: '123456789')
    assert_not user.save
  end

  test 'should not save user without password' do
    user = User.new(phone: '5555555555')
    assert_not user.save
  end

  test 'save user' do
    user = User.new(phone: '5555555555', password: '123456789', password_confirmation: '123456789')
    assert user.save
  end

  def setup
    @user = users(:one)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'email should not be present' do
    @user.email = ' '
    assert @user.valid?
  end

  test 'phone should not be longer 10 ' do
    @user.phone = '11111111111'
    assert_not @user.valid?
  end

  test 'phone should not be shorter 10 ' do
    @user.phone = '1111111'
    assert_not @user.valid?
  end

  test 'phone should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'phone should not only numeric ' do
    @user.phone = 'asde123456'
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
