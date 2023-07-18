namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed)
  end

  desc "Cadastra Moedas"
  task add_coins: :environment do
    puts "Cadastrando moedas..."
    coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png" },
      {
        description: "Ethereum",
        acronym: "ETH",
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

    puts "Cadastro de moedas concluído!"
  end

  desc "Cadastra Tipos de Mineração"
  task add_mining_types: :environment do
    mining_types = [
      { name: "Proof of Work", acronym: "PoW" },
      { name: "Proof of Stake", acronym: "PoS" },
      { name: "Proof of Capacity", acronym: "PoC" }
    ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
  end
end
