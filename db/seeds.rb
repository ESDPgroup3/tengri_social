# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
# include Faker

def copy_avatar_fixture(product, file)
  fixtures_path = Rails.root.join('app', 'assets', 'images', "#{file}.jpg")
  product.avatar.attach(io: File.open(fixtures_path), filename: "#{file}.jpg")
end

user1 = User.create(phone: '5555555555', password: '123456789', password_confirmation: '123456789', nickname: 'RenyVary')
  copy_avatar_fixture(user1, 1)
user2 = User.create(phone: '1111111111', password: '123456789', password_confirmation: '123456789', nickname: 'BuBuZa')
  copy_avatar_fixture(user2, 2)
user3 = User.create(phone: '2222222222', password: '123456789', password_confirmation: '123456789', nickname: 'tm20388')
  copy_avatar_fixture(user3, 3)
user4 = User.create(phone: '4444444444', password: '123456789', password_confirmation: '123456789', nickname: 'Sankhuan')
  copy_avatar_fixture(user4, 4)
user5 = User.create(phone: '3333333333', password: '123456789', password_confirmation: '123456789', nickname: 'Nutella')



def copy_picture_fixture(product, file)
  fixtures_path = Rails.root.join('app', 'assets', 'images', "#{file}.jpg")
  product.picture.attach(io: File.open(fixtures_path), filename: "#{file}.jpg")
end


@file = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

3.times do
  5.times do |n|
    n = Post.create(
      description: Faker::Lorem.sentence(15),
      user_id: (n + 1)
      )
    copy_picture_fixture(n, @file.sample)
  end
end