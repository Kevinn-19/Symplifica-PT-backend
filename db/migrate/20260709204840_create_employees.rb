class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
        create_table :empleados do |t|
        t.string :nombre, null: false
        t.string :apellido, null: false
        t.string :correo, null: false
        t.string :cargo, null: false
        t.string :ciudad, null: false

        t.timestamps
      end
      add_index :empleados, :correo, unique: true
  end
end
