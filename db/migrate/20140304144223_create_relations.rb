class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :home_id
      t.integer :follow_id

      t.timestamps
    end
  end
end
