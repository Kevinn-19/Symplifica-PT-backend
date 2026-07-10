class Employee < ApplicationRecord
  self.table_name = "empleados"

  has_many :benefits,
           class_name: "Benefit",
           foreign_key: "empleado_id",
           dependent: :destroy

  validates :nombre, :apellido, :correo, :cargo, :ciudad, presence: true
  validates :correo, uniqueness: true
end
