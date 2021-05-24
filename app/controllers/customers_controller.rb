class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    
    if @customer.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @customer
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:family_name, :family_kana, :given_name, :given_kana, :sex, :birthday_year,:birthday_month,:birthday_day,:zip,:pref,:addr,:addr2,:addr3,:tel, :email, :password, :password_confirmation)
  end
  
end
