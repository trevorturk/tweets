module Authentication

  # Returns true or false if the user is logged in.
  # Preloads @current_user with the user model if they're logged in.
  def logged_in?
    !!current_user
  end

  # Accesses the current user from the session.
  # Future calls avoid the database because nil is not equal to false.
  def current_user
    @current_user ||= (login_from_session || login_as_trevor) unless @current_user == false
  end

  # Store the given user id in the session.
  def current_user=(new_user)
    session[:user_id] = new_user ? new_user.id : nil
    @current_user = new_user || false
  end

  # Called from #current_user.  First attempt to login by the user id stored in the session.
  def login_from_session
    self.current_user = User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  # TODO make an actual login system
  def login_as_trevor
    self.current_user = User.find_by_login!('trevor')
  end
  
  # Inclusion hook to make #current_user and #logged_in?
  # available as ActionView helper methods.
  def self.included(base)
    base.send :helper_method, :current_user, :logged_in? if base.respond_to? :helper_method
  end
  
end