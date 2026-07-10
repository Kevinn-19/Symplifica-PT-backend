module Api
  class BenefitsController < ApplicationController

    def index
      employee = Employee.find(params[:employee_id])

      render json: employee.benefits
    end


    def show
      employee = Employee.find(params[:employee_id])
      benefit = employee.benefits.find(params[:id])

      render json: benefit
    end


    def create
      employee = Employee.find(params[:employee_id])
      benefit = employee.benefits.new(benefit_params)

      if benefit.save
        render json: benefit, status: :created
      else
        render json: benefit.errors, status: :unprocessable_entity
      end
    end


    def update
      employee = Employee.find(params[:employee_id])
      benefit = employee.benefits.find(params[:id])

      if benefit.update(benefit_params)
        render json: benefit
      else
        render json: benefit.errors, status: :unprocessable_entity
      end
    end


    def destroy
      employee = Employee.find(params[:employee_id])
      benefit = employee.benefits.find(params[:id])

      benefit.destroy

      head :no_content
    end


    private


    def benefit_params
      params.require(:benefit).permit(
        :nombre,
        :monto
      )
    end

  end
end