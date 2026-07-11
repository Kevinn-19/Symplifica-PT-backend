require "test_helper"

class EmployeeTest < ActiveSupport::TestCase

  test "should be valid with valid attributes" do
    employee = Employee.new(
      nombre: "Kevin",
      apellido: "Chiquillo",
      correo: "kevin@prueba.com",
      cargo: "Developer",
      ciudad: "Bogotá"
    )

    assert employee.valid?, employee.errors.full_messages.join(", ")
  end

  test "should require nombre" do
    employee = Employee.new(
      apellido: "Diaz",
      correo: "kevin@prueba.com",
      cargo: "Developer",
      ciudad: "Bogotá"
    )

    assert_not employee.valid?
    assert_includes employee.errors[:nombre], "can't be blank"
  end

  test "correo should be unique" do
    employee = employees(:one)

    duplicate = Employee.new(
      nombre: "Otro",
      apellido: "Usuario",
      correo: employee.correo,
      cargo: "Developer",
      ciudad: "Bogotá"
    )

    assert_not duplicate.valid?
  end

end