# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  #ゲストログイン機能
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  protected
# 退会しているかを判断するメソッド

  def reject_user
    @customer = Customer.find_by(email: params[:customer][:email])
      if @customer 
        if @customer.valid_password?(params[:customer][:password]) && (@customer.is_ban == true)
          flash[:notice] = "あなたは管理者によってBANされています。"
          redirect_to new_customer_registration_path
        else
          flash[:notice] = "項目を入力してください"
        end
      end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
