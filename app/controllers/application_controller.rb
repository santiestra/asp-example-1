class ApplicationController < ActionController::Base
  set_current_tenant_through_filter

  before_action :set_tenant

  def set_tenant
    # Aqui se setearia el tenant dependiendo del usuario logueado,
    #  o de la organizacion seteada en algun lado, como por ejemplo la url, etc..
    # En este caso, a modo de ejemplo, seteamos tan solo la primer compañia
    set_current_tenant(Company.first)
  end
end
