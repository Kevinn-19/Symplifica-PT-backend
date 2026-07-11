require "test_helper"

class Api::BenefitsControllerTest < ActionDispatch::IntegrationTest

  test "should get employee benefits" do
    get api_employee_benefits_url(employees(:one))

    assert_response :success
  end

  test "should create benefit" do
    assert_difference("Benefit.count") do
      post api_employee_benefits_url(employees(:one)), params: {
        benefit: {
          nombre: "Seguro médico",
          monto: 300000
        }
      }
    end

    assert_response :created
  end

  test "should delete benefit" do
    assert_difference("Benefit.count", -1) do
      delete api_employee_benefit_url(
        employees(:one),
        benefits(:one)
      )
    end

    assert_response :no_content
  end

end