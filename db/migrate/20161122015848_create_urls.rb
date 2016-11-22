class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      
      t.string :shortcut
      t.string :target

      t.timestamps
    end
  end
end
