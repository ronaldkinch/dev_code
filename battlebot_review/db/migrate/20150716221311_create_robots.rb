class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string :robot_name
      t.string :bot_type
      t.string :team
      t.string :builder
      t.string :wins
      t.string :loses

      t.timestamps null: false
    end
  end
end
