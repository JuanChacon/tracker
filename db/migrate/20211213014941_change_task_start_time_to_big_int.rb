class ChangeTaskStartTimeToBigInt < ActiveRecord::Migration
  def change
    change_column :tasks, :start_time, :bigint
  end
end
