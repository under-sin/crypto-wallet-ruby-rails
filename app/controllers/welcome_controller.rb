class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de ruby"
    session[:curso] = "Session salva"
    @nome = params[:nome]
    @sobrenome = params[:sobrenome]
  end
end