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
  confirm_customer = Customer.where(name: "テスト#{n + 1}", email: "test#{n + 1}@test.com")
  unless confirm_customer.exists?
    customer = Customer.new(name: "テスト#{n + 1}", email: "test#{n + 1}@test.com", password: "00000#{n + 1}")
    downloaded_image = File.open('./app/assets/images/DSC_0409.jpg')
    customer.profile_image.attach(io: downloaded_image, filename: 'DSC_0409.jpg')
    customer.save
  end
end

# ジャンル
genre_names = {
  'ジャパニーズウイスキー' => './app/assets/images/mt-fuji-gb83f2f3d8_1280.jpg',
  'アイリッシュウイスキー' => './app/assets/images/skyline-gf86aa047e_1280.jpg',
  'アメリカンウイスキー' => './app/assets/images/tourmakeady-gfb978ebac_1280.jpg',
  'スコッチウイスキー' => './app/assets/images/mountains-g8b8e99c57_1280.jpg'
}
genre_names.each do |genre_name_key, genre_name_value|
  confirm_genre_name = ProductionArea.where(genre_name: genre_name_key)
  unless confirm_genre_name.exists?
    production_area = ProductionArea.new(genre_name: genre_name_key)
    downloaded_image = File.open(genre_name_value)
    production_area.area_image.attach(io: downloaded_image, filename: genre_name_value.split('/').last)
    production_area.save
  end
end



# レビュー
reviews = {
  'ジャパニーズウイスキー' => 'ハイボールで飲むと特に美味しい',
  'ジャパニーズウイスキー' => '美味しい',
  'アイリッシュウイスキー' => 'ロックで飲むと味の変化が楽しい',
  'アイリッシュウイスキー' => 'ストレートでも甘味があっておいしい',
  'アメリカンウイスキー' => '特にハイボールで飲むのがおすすめ',
  'アメリカンウイスキー' => 'ロックやストレートなど色々な飲み方が楽しめる',
  'スコッチウイスキー' => '口当たりが良く飲みやすい',
  'スコッチウイスキー' => '後味のパンチが強く印象深かった'
}

reviews.each.with_index(1) do |(review_key, review_value), i|
  confirm_review = Review.where(content: review_value)
  unless confirm_review.exists?
    review = Review.new(content: review_value)
    review.customer_id = i.to_s
    review.production_area_id = ProductionArea.find_by(genre_name: review_key).id
    review.item = 'Makersmark'
    downloaded_image = File.open('./app/assets/images/DSC_0059.JPG')
    review.image.attach(io: downloaded_image, filename: 'DSC_0059.JPG')
    review.save
  end
end

# コメント
6.times do
  Comment.find_or_create_by(customer_id: '1',review_id: Review.find_by(content: 'ロックで飲むと味の変化が楽しい').id, detail: '美味しそう！')
end