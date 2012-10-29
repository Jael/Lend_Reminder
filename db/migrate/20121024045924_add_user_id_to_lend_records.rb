class AddUserIdToLendRecords < ActiveRecord::Migration
  def change
    add_column :lend_records, :user_id, :integer
  end
end
