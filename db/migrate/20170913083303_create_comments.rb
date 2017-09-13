class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

    	t.text :body

    	t.timestamps

    	t.references :photo, foreign_key: true
    	t.references :user, foreign_key: true


    end
  end
end
