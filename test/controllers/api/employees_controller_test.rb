require "test_helper"

class Api::EmployeesControllerTest < ActionDispatch::IntegrationTest

  test "should get employees index" do
    get api_employees_url

    assert_response :success
  end

 test "should show employee" do
  get api_employee_url(employees(:one))

  assert_response :success
end

  test "should create employee" do
    assert_difference("Employee.count") do
      post api_employees_url, params: {
        employee: {
          nombre: "Kevin",
          apellido: "Chiquillo",
          correo: "kevin@prueba.com",
          cargo: "Developer",
          ciudad: "Mosquera"
        }
      }
    end

    assert_response :created
  end

end