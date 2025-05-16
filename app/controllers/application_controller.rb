# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # no CSRF attacs :O
  protect_from_forgery with: :exception

end