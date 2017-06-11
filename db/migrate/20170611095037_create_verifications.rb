class CreateVerifications < ActiveRecord::Migration[5.0]
  def change
    create_table :verifications do |t|
      t.string :phone_number
      t.boolean :verified
      t.integer :complaint_id

      t.timestamps
    end
  end
end
