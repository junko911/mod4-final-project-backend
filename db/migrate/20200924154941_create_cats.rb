class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :url
      t.string :api_id

      t.timestamps
    end
  end
end
