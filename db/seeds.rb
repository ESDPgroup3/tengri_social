# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(phone: '1111111', password: '111111', password_confirmation: '111111')
User.create(phone: '2222222', password: '222222', password_confirmation: '222222')
User.create(phone: '3333333', password: '333333', password_confirmation: '333333')

require 'faker'
include Faker

def copy_image_fixture(product, file)
  fixtures_path = Rails.root.join('app', 'assets', 'images', "#{file}.jpg")
  product.images.attach(io: File.open(fixtures_path), filename: "#{file}.jpg")
end

@file = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

10.times do
  3.times do |n|
    n = Post.create(
      title: Faker::Lorem.sentence(1),
      description: Faker::Lorem.sentence(8),
      user_id: n
      )
    copy_image_fixture(n, @file.sample)
  end
end