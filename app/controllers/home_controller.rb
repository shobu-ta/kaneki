class HomeController < ApplicationController
  def top
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.username = "GUEST"
      user.phone_number = "07077777777"
      user.password = SecureRandom.urlsafe_base64
      user.avatar = ActiveStorage::Blob.create_and_upload!(
        io: File.open("#{Rails.root}/db/fixtures/kaneki-avatar.jpg"),
        filename: "kaneki-avatar.jpg"
      )
    end

    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end