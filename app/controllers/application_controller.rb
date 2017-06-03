# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_beginning_of_week

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for resource
    comfy_admin_cms_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
