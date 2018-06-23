class CreateCoordinators < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinators do |t|
      t.references :registrant, foreign_key: true, null: false, unique: true

      t.timestamps
    end
  end
end
