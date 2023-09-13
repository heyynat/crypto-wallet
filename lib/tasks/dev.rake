namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed)
    puts %x(rails dev:add_mining_types)
    puts %x(rails dev:add_coins)
  end

  desc "Cadastra Moedas"
  task add_coins: :environment do
    puts "Cadastrando moedas..."
    coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png",
        mining_type: MiningType.find_by(acronym: "PoW")
      },
      {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://download.logo.wine/logo/Ethereum/Ethereum-Logo.wine.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://cryptologos.cc/logos/dash-dash-logo.png",
        mining_type: MiningType.all.sample
      }
    ]

    coins.each do |coin|
      Coin.find_or_create_by!(coin)
    end

    puts "Cadastro de moedas concluído!"
  end

  desc "Cadastra Tipos de Mineração"
  task add_mining_types: :environment do
    puts "Cadastrando Tipos de Mineração..."
    mining_types = [
      { description: "Proof of Work", acronym: "PoW" },
      { description: "Proof of Stake", acronym: "PoS" },
      { description: "Proof of Capacity", acronym: "PoC" }
    ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
    puts "Cadastro de Tipos de Mineração concluído!"
  end
end
