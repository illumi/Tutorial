class ApplicationController < ActionController::Base
  protect_from_forgery

  def verify_is_admin
    (current_user.nil?) ? redirect_to(new_user_session_path) : (redirect_to(new_user_session_path) unless current_user.admin?)
  end
  
  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :layout => false, :status => :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

end
