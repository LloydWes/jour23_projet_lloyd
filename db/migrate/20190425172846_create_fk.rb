class CreateFk < ActiveRecord::Migration[5.2]
  def change
    # create_table :fks do |t|
    # end
  add_reference :users, :city, foreign_key: true
  add_reference :gossips, :user, foreign_key: true
  # add_reference :join_tags_gossips, :gossip, foreign_key: true
  # add_reference :join_tags_gossips, :tag, foreign_key: true
  end
end
