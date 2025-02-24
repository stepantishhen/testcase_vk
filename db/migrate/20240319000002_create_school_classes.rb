class CreateSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :school_classes do |t|
      t.integer :number
      t.string :letter
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end