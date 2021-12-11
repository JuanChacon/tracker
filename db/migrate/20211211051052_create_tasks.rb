class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :elapsed_time
      t.boolean :running,default: 0
      t.integer :start_time
      t.boolean :deleted, default: 0
      t.references :project,null: true, foreign_key: true, index:true

      t.timestamps null: false
    end
  end
end
