class ProtosController < ApplicationController
  def new
    @proto = Proto.new
  end

  def create
    binding.pry
    proto = Proto.create(title: create_params[:title], catch_copy: create_params[:catch_copy], concept: create_params[:concept])

    ProtoImage.create(image: create_params[:main_image], status: "main", proto_id: proto.id)

    if create_params[:sub_image1].present?
      ProtoImage.create(image: create_params[:sub_image1], status: "sub", proto_id: proto.id)
    end
    if create_params[:sub_image2].present?
      ProtoImage.create(image: create_params[:sub_image2], status: "sub", proto_id: proto.id)
    end
    redirect_to :root and return
  end

  private
    def create_params
      params.require(:proto).permit(:title, :catch_copy, :concept, :main_image, :sub_image1, :sub_image2)
    end
end
