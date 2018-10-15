# File: views/helpers/warden_helpers.rb
#

class SknWeb

  def login_required?
    unless public_page? || logged_in?
      session['skn.attempted.page'] = request.path
      env.dig('warden.options') ?
          (env['warden.options'][:attempted_path] = request.path) :
            (env['warden.options'] = {attempted_path: request.path})
      authenticate!({attempted_path: request.path})
    end
  end

  def warden_messages
    # flash_message(:info, warden.message) unless warden.message.nil? # From Strategies
    flash_message(:danger, warden.errors.full_messages) unless warden.errors.empty?
  end

  def logged_in?
    !!warden.user
  end

  def redirect_to_origin
    orig = (env.dig('warden.options',:attempted_path) || session['skn.attempted.page'])
    if orig.nil? || orig.empty? || orig.start_with?('/sessions') || orig.eql?('/signin')
      orig = '/profiles/resources'
    end
    SknApp.logger.debug "#{self.class}##{__method__}() Returns: [#{orig}]"
    orig
  end

  def public_page?
    publics.any? {|p| p.start_with?(request.path) } || request.path.eql?('/')
  end
  def publics
    @_publics ||= SknSettings.security.public_pages
  end

  # The main accessor for the warden proxy instance
  # :api: public
  def warden
    env['warden']
  end

  # Proxy to the authenticate method on warden
  # - Run strategies
  # - halt on failure
  # - returns user
  # :api: public
  def authenticate!(*args)
    warden.clear_strategies_cache!
    warden.authenticate!(*args)
  end

  # Access the currently logged in user
  # :api: public
  def current_user(*args)
    warden.user(*args)
  end
  def current_user=(user)
    warden.set_user user
  end

  def logout(*list_of_scopes)
    warden.raw_session.inspect
    warden.logout(*list_of_scopes)
  end

end
