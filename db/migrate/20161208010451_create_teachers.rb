class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.boolean :admin

      t.integer :school_id

      t.timestamps
    end
  end
end
