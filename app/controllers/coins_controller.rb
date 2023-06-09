class CoinsController < ApplicationController
  #layout "admin" # informando o layout - por padrão o rails pega o application
  before_action :set_coin, only: %i[ show edit update destroy ]
  before_action :set_mining_type_options, only: %i[ new create edit update ]

  # GET /coins or /coins.json
  def index
    @coins = Coin.all
  end

  # GET /coins/1 or /coins/1.json
  def show
  end

  # GET /coins/new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins or /coins.json
  def create
    @coin = Coin.new(coin_params)

    respond_to do |format|
      if @coin.save
        format.html { redirect_to coin_url(@coin), notice: "Coin was successfully created." }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1 or /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to coin_url(@coin), notice: "Coin was successfully updated." }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1 or /coins/1.json
  def destroy
    @coin.destroy

    respond_to do |format|
      format.html { redirect_to coins_url, notice: "Coin was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
    # método privado que vai ser usado no select (isso é para não chamarmos a model direto na view)
    def set_mining_type_options
      @mining_type_options = MiningType.all.pluck(:description, :id)
    end

    # Use retornos de chamada para compartilhar configurações ou restrições comuns entre ações.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Permitir apenas uma lista de parâmetros confiáveis.
    # o .permit funciona ocmo uma segurança maior para o app. Só teremosa acesso a esses dados.
    def coin_params
      params.require(:coin).permit(:description, :acronym, :url_image, :mining_type_id)
    end
end