class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

    	t.string :username
    	t.string :gender
    	t.date :date_of_birth
    	t.references :photoalbum, foreign_key: true

    	t.timestamps

    end
  end
end
