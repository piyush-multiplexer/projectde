class AddRolesToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :superadmin, :boolean, default: false
    add_column :admins, :admin, :boolean, default: false
    add_column :admins, :member, :boolean, default: true
  end
end
