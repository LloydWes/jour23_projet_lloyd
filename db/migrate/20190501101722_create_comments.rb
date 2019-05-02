class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.belongs_to :gossip, index: true
      t.timestamps
    end
  end
end