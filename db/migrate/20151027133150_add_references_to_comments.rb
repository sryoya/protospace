class AddReferencesToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :proto, index: true, foreign_key: true
    add_reference :comments, :user, index: true, foreign_key: true
  end
end
