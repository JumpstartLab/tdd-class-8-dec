class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :must_be_logged_in

  private

  def must_be_logged_in
    current_merchant || redirect_to('http://google.com')
  end

  def current_merchant
    @current_merchant ||= Merchant.find_by_id(session[:merchant_id])
  end
end
