class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :deleted,default:0 # constraint for new object, always is created with value 0

      t.timestamps null: false
    end
  end
end
