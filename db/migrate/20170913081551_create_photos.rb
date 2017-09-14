class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|

    	t.string :title
    	t.text :description
    	t.string :image

    	t.timestamps

    	t.references :photoalbum, foreign_key: true

    end
  end
end
