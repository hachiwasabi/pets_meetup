# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

yamada = User.find_or_create_by!(email: "yamada@example.com") do |user|
  user.name = "山田　太郎"
  user.password = "password"
  user.pet_type = "犬"
  user.pet_name = "ポチ"
  user.bio = "自慢の可愛いサモエドちゃんです。好奇心旺盛です。"
  user.profile_image.attach(
  io: File.open(Rails.root.join("app/assets/images/dog_profile.jpg")),
  filename: "dog_profile.jpg"
  )
end

tanaka = User.find_or_create_by!(email: "tanaka@example.com") do |user|
  user.name = "田中　一郎"
  user.password = "password"
  user.pet_type = "猫"
  user.pet_name = "タマ"
  user.bio = "我が家の癒し担当です。やんちゃですがかわいいです。"
  user.profile_image.attach(
  io: File.open(Rails.root.join("app/assets/images/cat_profile.jpg")),
  filename: "cat_profile.jpg"
  )
end


satou = User.find_or_create_by!(email: "satou@example.com") do |user|
  user.name = "佐藤　花子"
  user.password = "password"
  user.pet_type = "うさぎ"
  user.pet_name = "もち"
  user.bio = "寂しがり屋のロップイヤーなので、毎日たくさん遊んでます！"
  user.profile_image.attach(
  io: File.open(Rails.root.join("app/assets/images/rabbit_profile.jpg")),
  filename: "rabbit_profile.jpg"
  )
end



post1 = Post.find_or_create_by!(title: "なんでも興味津々", user: yamada) do |post|
  post.body = "いつも僕のあとをついてきて、やることなすことに興味津々。そこがすごくかわいくて魅力的です。"
  post.images.attach([  { io: File.open(Rails.root.join("app/assets/images/dog_post.jpg")), filename: "dog_post.jpg" } ])
end

post2 = Post.find_or_create_by!(title: "今日もまた食器が…", user: tanaka) do |post|
  post.body = "愛猫。とてもかわいいのですが、今日もまたテーブルの上のコップを落としてしまいました…可愛いんですけどね…(´;ω;｀)"
  post.images.attach([  { io: File.open(Rails.root.join("app/assets/images/cat_post.jpg")), filename: "cat_post.jpg" } ])
end

post3 = Post.find_or_create_by!(title: "甘えん坊", user: satou) do |post|
  post.body = "寂しがり屋で横で良くゴロンとしています。触らせてくれる時とそうじゃないときがあるので、そこは時の運です。"
  post.images.attach([  { io: File.open(Rails.root.join("app/assets/images/rabbit_post.jpg")), filename: "rabbit_post.jpg" } ])
end

user1 = User.find(2)
group1 = Group.find_or_create_by!(name: "わんにゃん同好会", owner_id: user1.id) do |group|
  group.description = "イヌネコ大好きな皆様！集まってワイワイしましょうー！"
  group.image.attach( io: File.open(Rails.root.join("app/assets/images/dogcat_group.jpg")), filename: "dogcat_group.jpg")
end