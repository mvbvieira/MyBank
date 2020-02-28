class RevenuesController < ApplicationController
  def new
    @revenue = current_user.revenues.new
    @status = Revenue::STATUS
    @payment_methods = current_user.payment_methods.all
  end

  def create
    @revenue = current_user.revenues.new(revenue_params)
    @payment_methods = current_user.payment_methods.all
    @status = Revenue::STATUS

    if @revenue.save
      flash[:notice] = 'Receita cadastrada com sucesso'
      redirect_to '/'
    else
      flash[:alert] = 'Não foi possível cadastrar o receita'
      render :new
    end
  end

  private

  def revenue_params
    params.require(:revenue).permit(:description, :_type, :brand, :status,
                                    :amount, :received_at, :payment_method_id)
  end
end
