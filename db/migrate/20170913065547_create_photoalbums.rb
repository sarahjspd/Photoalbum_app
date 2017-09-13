class CreatePhotoalbums < ActiveRecord::Migration[5.1]
  def change
    create_table :photoalbums do |t|

    	t.string :string
    	t.text :description


    	t.references :user, foreign_key: true

    	t.timestamps

    end

  end
end
