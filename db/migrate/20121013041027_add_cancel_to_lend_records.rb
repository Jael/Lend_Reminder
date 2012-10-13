class AddCancelToLendRecords < ActiveRecord::Migration
  def change
    add_column :lend_records, :cancel, :boolean, default: false
  end
end
