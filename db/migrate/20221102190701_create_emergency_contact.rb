class CreateEmergencyContact < ActiveRecord::Migration[5.2]
  def change
    create_table :emergency_contacts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :phone_number
    end
  end
end
