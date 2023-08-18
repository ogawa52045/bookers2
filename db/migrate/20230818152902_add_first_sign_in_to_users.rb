# app/controllers/custom_sessions_controller.rb
class CustomSessionsController < Devise::SessionsController
  def destroy
    super
    set_flash_message! :notice, :sign_out if sign_out
  end
end

