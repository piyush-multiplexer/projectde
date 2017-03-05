class Adminuser < ActiveRecord::Migration[5.0]
    def up
      create_table :adminusers do |t|
        t.string :username
        t.string :email
        t.string :password_digest

        t.timestamps
      end
    end
end
