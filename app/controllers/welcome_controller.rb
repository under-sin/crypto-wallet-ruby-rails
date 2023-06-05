class WelcomeController < ApplicationController
  def index
    @nome = params[:nome]
    @sobrenome = params[:sobrenome]
  end
end