namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development? # so funciona em ambiente de desenvolvimento
      show_spinner("Limpando o banco de dados") { %x(rails db:drop) }
      show_spinner("Criando o banco de dados") { %x(rails db:create) }

      # outra forma de usar o yield passando um bloco de codigo
      show_spinner("Fazendo migrações") do
        %x(rails db:migrate) 
      end
      
      # chama as outras rake para popular o banco
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Essa task só pode ser executada em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas padrão"
  task add_coins: :environment do
    show_spinner("Cadastrando as moedas") do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://static.vecteezy.com/system/resources/thumbnails/008/505/801/small_2x/bitcoin-logo-color-illustration-png.png'
        },
        {
          description: 'Ethereum',
          acronym: 'ETC',
          url_image: 'https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png'
        },
        {
          description: 'Dogecoin',
          acronym: 'DOGE',
          url_image: 'https://img2.gratispng.com/20180401/jkq/kisspng-shiba-inu-dogecoin-clip-art-doge-5ac19a4f2bb505.8373672415226373911791.jpg'
        },
      ]
    
      # Essa forma percorrendo um hash tbm serve para o create!
      # O principal motivo de usar o find_or_create_by é evitar duplicidade de dados
      coins.each do |coin|
        Coin.find_or_create_by!(coin) # find_or_create_by vai ver se já existe esse dado cadastrado, caso não, cria.
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando os tipos de mineração") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW" },
        {description: "Proof of Stake", acronym: "PoS" },
        {description: "Proof of Capacitu", acronym: "PoC" },
      ]
    
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
