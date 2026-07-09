class BenefitsController < ApplicationController
  before_action :set_employee

  def index
    render json: @employee.benefits
  end

  def create
    benefit = @employee.benefits.new(benefit_params)

    if benefit.save
      render json: benefit, status: :created
    else
      render json: benefit.errors, status: :unprocessable_entity
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def benefit_params
    params.require(:benefit).permit(
      :nombre,
      :monto
    )
  end
end