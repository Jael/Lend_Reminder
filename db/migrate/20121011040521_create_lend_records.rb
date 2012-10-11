class CreateLendRecords < ActiveRecord::Migration
  def change
    create_table :lend_records do |t|
      t.decimal :amount
      t.date :date
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
