class AddMongoIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :mongo_id, :string, null: false, unique: true
  end
end
