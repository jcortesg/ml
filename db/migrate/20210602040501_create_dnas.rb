class CreateDnas < ActiveRecord::Migration[6.1]
  def change
    create_table :dnas do |t|
      t.string :sequence,     null: false
      t.timestamps
    end
  end
end
