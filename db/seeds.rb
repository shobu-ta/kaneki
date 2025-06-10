# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by(email: "admin@admin") do |admin|
  admin.password = "adminadmin"
end

User.find_or_create_by!(email: "kaneki@example.com") do |user|
  user.name = "カネキ"
  user.username = "kaneki"
  user.phone_number = "09012345678"
  user.password = "securepassword"
  user.password_confirmation = "securepassword"
  user.avatar = ActiveStorage::Blob.create_and_upload!(
    io: File.open("#{Rails.root}/db/fixtures/kaneki-avatar.jpg"),
    filename: "kaneki-avatar.jpg"
  )
end
