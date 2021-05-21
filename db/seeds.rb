# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者ログイン情報
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


# ユーザー情報と投稿
#15.times do |n|
#    User.create!(
 #     email: "test#{n + 1}@test.com",
  #    name: "テスト太郎#{n + 1}",
   #   image: File.open('./app/assets/images/no-image.jpg')
    #)
  #end

  #User.all.each do |user|
  #user.articles.create!(
  # title: '',
  # introduction: '',
  # postal_code: '',
  # prefecture_code: '',
  # city: '',
  # street: '',
  # telephone_number: '',
  # url: '',

  #)
#end
