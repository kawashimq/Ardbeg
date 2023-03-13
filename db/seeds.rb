# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者用メールアドレス、パスワード
admin = Admin.where(email: 'test@admin')
Admin.create!(email: 'test@admin', password: '123456') unless admin.exists?

# 会員情報
# 探すときencrypted_passwordを使う
# 作るときはpasswordを使う
# 画像の挿入時はFile.openとattachの処理を分けて書く
6.times do |n|
  confirm_customer = Customer.where(name: "テスト#{n + 1}", email: "test#{n + 1}@test.com", encrypted_password: "'00000' + '#{n + 1}'")
  unless confirm_customer.exists?
    customer = Customer.new(name: "テスト#{n + 1}", email: "test#{n + 1}@test.com", password: "'00000' + '#{n + 1}'")
    downloaded_image = File.open('./app/assets/images/sample-author1.jpg')
    customer.profile_image.attach(io: downloaded_image, filename: 'sample-author1.jpg')
    customer.save
  end
end

