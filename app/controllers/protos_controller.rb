class ProtosController < ApplicationController
  def new
    @proto = Proto.new
  end

  def create
    Proto.create(title: create_params[:title], catch_copy: create_params[:catch_copy], concept: create_params[:concept])
    redirect_to :root and return
  end

  private
    def create_params
      params.require(:proto).permit(:title, :catch_copy, :concept)
    end
end
