class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @protos = Proto.tagged_with(params[:id])
  end
end
