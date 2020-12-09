class CreateNurses < ActiveRecord::Migration[5.2]
  def change
    create_table :nurses do |t|
      t.string :name

      t.timestamps
    end
  end
end
