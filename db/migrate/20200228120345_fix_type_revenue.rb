class FixTypeRevenue < ActiveRecord::Migration[6.0]
  def change
    rename_column :revenues, :type, :_type
  end
end
