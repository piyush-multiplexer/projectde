class AddCommentsToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :message, :string
  end
end
