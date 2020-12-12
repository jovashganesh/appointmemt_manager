class RemoveUserIdFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :user_id, :integer
  end
end
