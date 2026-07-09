class Benefit < ApplicationRecord
  self.table_name = "beneficios"

  belongs_to :employee,
             class_name: "Employee",
             foreign_key: "empleado_id"
  
  validates :nombre, :monto, presence: true
  validates :monto, numericality: { greater_than: 0 }
end