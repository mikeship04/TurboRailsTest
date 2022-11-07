class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end
end
