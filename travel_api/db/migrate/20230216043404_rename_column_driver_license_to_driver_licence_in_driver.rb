class RenameColumnDriverLicenseToDriverLicenceInDriver < ActiveRecord::Migration[7.0]
  def change
    rename_column :drivers, :driver_license, :driver_licence
  end
end
