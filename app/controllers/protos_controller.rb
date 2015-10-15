class ProtosController < ApplicationController
  def new
    @proto = Proto.new
  end

  def create
    redirect_to :root and return
  end


end
