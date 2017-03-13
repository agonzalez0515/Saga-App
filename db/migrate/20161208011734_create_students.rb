class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :team_id
      t.integer :school_id

      t.string :name
      t.integer :grade
      t.string :gender
      t.decimal :GPA
      t.integer :detentions
      t.string :fav_animal
      t.string :shirt_size
      t.string :allergies
      t.string :emergency_contact 

      t.timestamps
    end
  end
end
