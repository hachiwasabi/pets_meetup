# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password123"
end

yamada = User.find_or_create_by!(email: "yamada@example.com") do |user|
  user.name = "山田　太郎"
  user.password = "password"
  user.pet_type = "犬"
  user.pet_name = "ポチ"
  user.bio = "黒の豆柴です。好奇心旺盛です。"
end

tanaka = User.find_or_create_by!(email: "tanaka@example.com") do |user|
  user.name = "田中　一郎"
  user.password = "password"
  user.pet_type = "猫"
  user.pet_name = "タマ"
  user.bio = "スコティッシュフォールドです。やんちゃですがかわいいです。"
end

satou = User.find_or_create_by!(email: "satou@example.com") do |user|
  user.name = "佐藤　花子"
  user.password = "password"
  user.pet_type = "うさぎ"
  user.pet_name = "とき、ひかり"
  user.bio = "うさぎ２匹飼っています。黒とグレーのライオンラビット２匹です。"
end


Post.find_or_create_by!(title: "なんでも興味津々", user: yamada) do |post|
  post.body = "いつも僕のあとをついてきて、やることなすことに興味津々。そこがすごくかわいくて魅力的です。"
end

Post.find_or_create_by!(title: "今日もまた食器が…", user: tanaka) do |post|
  post.body = "愛猫。とてもかわいいのですが、今日もまたテーブルの上のコップを落としてしまいました…可愛いんですけどね…(´;ω;｀)"
end

Post.find_or_create_by!(title: "気分屋の２匹", user: satou) do |post|
  post.body = "一緒に行動することが多い２匹。１匹が移動すると少し経ってから追いかけて、ゴロンとしています。触らせてくれる時とそうじゃないときがあるので、そこは時の運です。笑"
end