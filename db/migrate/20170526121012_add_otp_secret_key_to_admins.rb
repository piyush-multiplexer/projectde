class AddOtpSecretKeyToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :otp_secret_key, :string
    add_column :admins, :otp_module, :integer, default: 0
  end
end
