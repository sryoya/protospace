class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used.page(params[:page]).per(30)
  end

  def show
    @protos = Proto.tagged_with(params[:id]).page(params[:page]).per(8)
  end
end
