class ProtosController < ApplicationController
  def new
    @proto = Proto.new
    @proto.proto_images.build
  end

  def create
    Proto.new(create_params)
    
    redirect_to :root and return
  end

  private
    def create_params
      params.require(:proto).permit(:title, :catch_copy, :concept, proto_images_attributes: [:image, :status])
    end
end
