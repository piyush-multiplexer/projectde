class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.string :r_fname # registering user details
      t.string :r_lname
      t.string :r_age
      t.string :r_gender
      t.string :r_email
      t.string :r_phone
      t.string :r_pincode
      t.text :r_address
      t.string :r_photo
      t.string :v_fname # victim details
      t.string :v_lname
      t.integer :v_age
      t.string :v_gender
      t.string :v_phone
      t.string :v_email
      t.text :v_address
      t.string :v_relation
      t.string :v_photo
      t.string :c_fullname # against details
      t.integer :c_age
      t.string :c_gender
      t.text :c_address
      t.string :c_photo
      t.text :c_details
      t.string :cm_type # complaint details
      t.string :cm_location
      t.date :cm_date
      t.string :cm_rfactor
      t.text :cm_details
      t.string :cm_photo
      t.integer :user_id # user tracking
      t.string :complaintid, unique: true # unique complaint id

      t.timestamps
    end
  end
end
