module ApplicationHelper
  def data_br(data_us)
    data_us.strftime("%d-%m-%Y")
  end

  def application_name
    "Crypto Wallet"
  end

  def get_environment
    if(Rails.env.development?)
      "Desenvolvimento"
    elsif(Rails.env.production)
      "Produção"
    else
      "Teste"
    end
  end
end
