class PaymentMethodsController < ApplicationController
  def new
    @payment_method = current_user.payment_methods.new
  end

  def create
    @payment_method = current_user.payment_methods.new(payment_method_params)

    if @payment_method.save
      flash[:notice] = 'Metodo cadastrada com sucesso'
      redirect_to '/'
    else
      flash[:alert] = 'Não foi possível cadastrar o metodo'
      render :new
    end
  end

  private

  def payment_method_params
    params.require(:payment_method).permit(:description)
  end
end
