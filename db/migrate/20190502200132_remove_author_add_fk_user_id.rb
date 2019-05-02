class RemoveAuthorAddFkUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :author, :string
    add_reference :comments, :user, index: true
  end
end
