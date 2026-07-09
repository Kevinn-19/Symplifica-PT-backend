class CreateBenefits < ActiveRecord::Migration[8.1]
  def change
      create_table :beneficios do |t|
        t.references :empleado, null: false, foreign_key: { to_table: :empleados }
        t.string :nombre, null: false
        t.decimal :monto, precision: 10, scale: 2, null: false

        t.timestamps
      end
  end
end
