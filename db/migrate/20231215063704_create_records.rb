class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.date :test_date
      t.integer :grade
      t.integer :first_stage
      t.integer :second_stage
      t.integer :result
      t.integer :reading
      t.integer :writing
      t.integer :listening
      t.integer :speaking

      t.timestamps
    end
  end
end
