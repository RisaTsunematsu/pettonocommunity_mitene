# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#Admin.create!(
    #email: 'moca04@gmail.com',
    #password: '000000',
#)

# Tag.create([
#1   { name: '犬' },
#2   { name: 'ねこ' },
#3   { name: 'うさぎ' },
#4   { name: 'ハムスター' },
#5   { name: 'その他のペット' }
# ])

users = User.create!(
  [
    {first_name: '山田', last_name: '花子', first_name_kana: 'ヤマダ', last_name_kana: 'ハナコ', handlename: 'ハナ', email: 'test01@mail.com', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_user_youngwoman.png"), filename:"pf_sample_user_youngwoman.png")},
    {first_name: '田中', last_name: '正男', first_name_kana: 'タナカ', last_name_kana: 'マサオ', handlename: 'マサ', email: 'test02@mail.com', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_user_youngman.png"), filename:"pf_sample_user_youngman.png")},
    {first_name: '鈴木', last_name: '武生', first_name_kana: 'スズキ', last_name_kana: 'タケオ', handlename: 'タケ', email: 'test03@mail.com', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_user_boy.png"), filename:"pf_sample_user_boy.png")},
    {first_name: '高橋', last_name: '佳子', first_name_kana: 'タカハシ', last_name_kana: 'ヨシコ', handlename: 'ヨッシー', email: 'test04@mail.com', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_user_girl.png"), filename:"pf_sample_user_girl.png")}
  ]
 )



posts = Post.create!(
  [
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_situke.jpeg"), 
    filename:"pf_sample_post_situke.jpeg"), 
    title: 'しつけ教室', tag: '#愛犬 #しつけ教室',
    body: '今日はしつけ教室に行きました。', 
    user_id: users[0].id },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_dogs.jpeg"), 
    filename:"pf_sample_post_dogs.jpeg"), 
    title: '愛犬', tag: '#愛犬 #家族',
    body: '我が家の愛犬です。', 
    user_id: users[0].id },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_cat.jpeg"), 
    filename:"pf_sample_post_cat.jpeg"), 
    title: 'にゃんこ', tag: '#愛猫 #家族',
    body: '我が家の愛猫です。', 
    user_id: users[1].id },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_usagi.jpeg"), 
    filename:"pf_sample_post_usagi.jpeg"), 
    title: 'うさちゃん', tag: '#うさぎ #家族',
    body: '我が家のうさぎです。', 
    user_id: users[1].id },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_usagi2.jpeg"), 
    filename:"pf_sample_post_usagi2.jpeg"), 
    title: '卯年', tag: '#うさぎ #卯年',
    body: '卯年なのでうさぎを飼いました。', 
    user_id: users[2].id },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_hamu.jpeg"), 
    filename:"pf_sample_post_hamu.jpeg"), 
    title: 'ハム太郎', tag: '#ハムスター #ハム太郎',
    body: 'ハム太郎です。', 
    user_id: users[2].id },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_househamu.jpeg"), 
    filename:"pf_sample_post_househamu.jpeg"), 
    title: 'ハムの家', tag: '#ハムスター #お家',
    body: 'ハムの家です。', 
    user_id: users[3].id },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_tori.jpeg"), 
    filename:"pf_sample_post_tori.jpeg"), 
    title: 'インコ', tag: '#インコ #鳥',
    body: 'インコを飼っています。', 
    user_id: users[3].id },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pf_sample_post_koi.png"), 
    filename:"pf_sample_post_koi.png"), 
    title: '鯉', tag: '#錦鯉 #魚',
    body: '錦鯉です。', 
    user_id: users[3].id },
  ]
)



PostTagRelation.create!(
  post_id: posts[0].id,
  tag_id: 1
  )
 
PostTagRelation.create!(
  post_id: posts[1].id,
  tag_id: 1
  )

PostTagRelation.create!(
  post_id: posts[2].id,
  tag_id: 2
  )
  
PostTagRelation.create!(
  post_id: posts[3].id,
  tag_id: 3
  )

PostTagRelation.create!(
  post_id: posts[4].id,
  tag_id: 3
  )
  
PostTagRelation.create!(
  post_id: posts[5].id,
  tag_id: 4
  )
  
PostTagRelation.create!(
  post_id: posts[6].id,
  tag_id: 4
  )

PostTagRelation.create!(
  post_id: posts[7].id,
  tag_id: 5
  )

PostTagRelation.create!(
  post_id: posts[8].id,
  tag_id: 5
  )