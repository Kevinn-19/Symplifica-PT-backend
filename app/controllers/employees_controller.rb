class EmployeesController < ApplicationController
  def index
    render json: Employee.all
  end

  def show
    employee = Employee.find(params[:id])
    render json: employee, include: :benefits
  end

  def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: employee, status: :created
    else
      render json: employee.errors, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(
      :nombre,
      :apellido,
      :correo,
      :cargo,
      :ciudad
    )
  end
end