# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Admin.create!(
    email: 'moca04@gmail.com',
    password: '000000',
)

Tag.create([
  { name: '犬' },
  { name: 'ねこ' },
  { name: 'うさぎ' },
  { name: 'ハムスター' },
  { name: 'その他のペット' }
])

users = User.create!(
  [
    {first_name: '山田', last_name: '花子', first_name_kana: 'ヤマダ', last_name_kana: 'ハナコ', handlename: 'ハナ', email: 'test@mail.com', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_user_youngwoman.png"), filename:"pf_sample_user_youngwoman.png")}
    
  ]
)

Post.create!(
  [
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_situke.jpeg"), filename:"pf_sample_post_situke.jpeg"), title: 'しつけ教室', tag: '#愛犬 #しつけ教室', body: '今日はしつけ教室に行きました。', user_id: users[0].id }
    
  ]
)