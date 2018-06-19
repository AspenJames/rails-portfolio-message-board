class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :topic
      t.integer :created_by

      t.timestamps
    end
  end
end
