# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png" },
      {
        description: "Ethereum",
        acronym: "ETC",
        url_image: "https://download.logo.wine/logo/Ethereum/Ethereum-Logo.wine.png"
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://cryptologos.cc/logos/dash-dash-logo.png"
      }
    ]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end
