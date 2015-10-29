class TagsController < ApplicationController
  def index
    @tags = Proto.all_tags
  end
end
