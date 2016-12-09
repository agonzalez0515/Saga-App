class AddAdminCodeToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :admin_code, :string
    add_column :schools, :teacher_code, :string
  end
end
