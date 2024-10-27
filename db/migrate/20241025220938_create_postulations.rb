class CreatePostulations < ActiveRecord::Migration[7.2]
  def change
    create_table :postulations do |t|
      t.string :title
      t.text :description
      t.datetime :daypostulation

      t.timestamps
    end
  end
end
