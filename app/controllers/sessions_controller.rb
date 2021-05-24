class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @customer
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  
  def login(email, password)
    @customer = Customer.find_by(email: email)
    if @customer && @customer.authenticate(password)
      # ログイン成功
      session[:customer_id] = @customer.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
end
