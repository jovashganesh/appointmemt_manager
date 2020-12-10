class AddUserIdToPatient < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :user, index: true
  end
end
