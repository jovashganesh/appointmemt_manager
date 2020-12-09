class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :patient, foreign_key: true
      t.references :nurse, foreign_key: true

      t.timestamps
    end
  end
end
