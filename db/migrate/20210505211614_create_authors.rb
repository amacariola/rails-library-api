class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :biography
      t.string :genres

      t.timestamps
    end
  end
end
