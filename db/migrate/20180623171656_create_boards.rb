class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :host
      t.string :guest

      t.timestamps
    end
  end
end
