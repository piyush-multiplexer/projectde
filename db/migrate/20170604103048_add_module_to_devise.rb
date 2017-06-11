class AddModuleToDevise < ActiveRecord::Migration[5.0]
  def up
    ## Confirmable users
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string


    ## Lockable users
    add_column :users, :failed_attempts, :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column :users, :unlock_token, :string # Only if unlock strategy is :email or :both
    add_column :users, :locked_at, :datetime

    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true

    User.all.update_all confirmed_at: Time.now
    ## Confirmable admins
    add_column :admins, :confirmation_token, :string
    add_column :admins, :confirmed_at, :datetime
    add_column :admins, :confirmation_sent_at, :datetime
    add_column :admins, :unconfirmed_email, :string

    ## Lockable admins
    add_column :admins, :failed_attempts, :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column :admins, :unlock_token, :string # Only if unlock strategy is :email or :both
    add_column :admins, :locked_at, :datetime


    add_index :admins, :confirmation_token,   unique: true
    add_index :admins, :unlock_token,         unique: true

    Admin.all.update_all confirmed_at: Time.now
  end

  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
  end
end
