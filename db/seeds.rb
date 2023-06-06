# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Coin.create!(
  description: 'Bitcoin',
  acronym: 'BTC',
  url_image: 'https://static.vecteezy.com/system/resources/thumbnails/008/505/801/small_2x/bitcoin-logo-color-illustration-png.png'
)

Coin.create!(
  description: 'Ethereum',
  acronym: 'ETC',
  url_image: 'https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png'
)

Coin.create!(
  description: 'Dogecoin',
  acronym: 'DOGE',
  url_image: 'https://img2.gratispng.com/20180401/jkq/kisspng-shiba-inu-dogecoin-clip-art-doge-5ac19a4f2bb505.8373672415226373911791.jpg'
)

puts "Moedas padrão cadastradas com sucesso!"