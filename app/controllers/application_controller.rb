class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def render_403
    render :status => :forbidden, :text => "Forbidden fruit"
  end

  def current_animateur
    current_contributeur if current_contributeur.type == 'Animateur'
  end

  def authenticate_animateur!
    authenticate_contributeur!
    render_403 unless current_animateur
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:pseudo, :nom, :prenom, :annee_naissance, :commune, :status, :charte, :sexe, :telephone, :newsletter]
  end
end
