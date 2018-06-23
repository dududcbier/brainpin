class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :interest
      t.integer :school_year, null: false
      t.date :birth_date, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
