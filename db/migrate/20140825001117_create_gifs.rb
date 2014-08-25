class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
