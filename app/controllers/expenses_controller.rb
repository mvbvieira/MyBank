class ExpensesController < ApplicationController
  def new
    @expense = current_user.expenses.new
    @payment_methods = current_user.payment_methods.all
    @status = Expense::STATUS
  end

  def create
    @expense = current_user.expenses.new(expense_params)
    @payment_methods = current_user.payment_methods.all
    @status = Expense::STATUS

    if @expense.save
      flash[:notice] = 'Despesa cadastrada com sucesso'
      redirect_to '/'
    else
      flash[:alert] = 'Não foi possível cadastrar o Despesa'
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :payed_at, :due_at, :status,
                                    :value, :payment_method_id)
  end
end
