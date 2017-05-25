# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_beginning_of_week

  def after_sign_in_path_for resource
    comfy_admin_cms_path
  end

  private
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
