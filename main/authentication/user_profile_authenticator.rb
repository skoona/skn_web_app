# File: ./strategy/authentication/user_profile_authenticator.rb
#
# Authentication methods used primarily by Warden to establish and maintain a sessions
# - Depends on #last_access method from UserProfile
# ##
module Authentication
  class UserProfileAuthenticator

    include CacheProvider
    include UserProfileKeyEncrypt

    def self.authenticate(username, password)
      find_and_authenticate(username, password)
    end

    def self.find_and_authenticate(username, password)
      user = user_repo.find_by(username: username)
      if user && self.valid_digest?(user.password_digest, password)
        userp = self.new(user)
        debug_log "#{self.name}##{__method__}(success) Returns => #{user_profile_name(userp)}"
        userp
      else
        debug_log "#{self.name}##{__method__}(Failed) Returns => #{user_profile_name(user)}"
        nil
      end
    end

    # Warden calls this
    def self.fetch_cached_user(id_value)
      userp = cache_provider_fetch_user(id_value.to_i)
      if userp && !userp.last_login_time_expired?
        userp.last_access = Time.now.getlocal
      else
        cache_provider_delete_user(userp)
        userp = nil  # force login as time has expired or cache was purged.
      end
      debug_log "#{self.name}##{__method__}() Returns => #{user_profile_name(userp)}"

      userp
    end

    def self.user_profile_name(userp)
      !!userp ? userp&.name : 'No User!'
    end

    # Warden calls this
    def self.fetch_remembered_user (token=nil)
      return nil if token.nil?
      upp = nil
      user_obj = user_repo.find_by(remember_token: token)
      upp = self.new(user_obj) if user_obj and valid_digest?(user_obj.remember_token_digest, token)
      cache_provider_add_user(upp) if upp
      upp
    end

    # ContentProfile will call this
    def self.page_user(uname)
      userp = nil
      value = user_repo.find_by(username: uname)
      userp = self.new(value) if value
      userp = nil unless userp
      debug_log("#{self.name.to_s}.#{__method__}(#{uname}) Returns => #{userp&.name}")
      userp
    end


    def self.user_repo
      Persistence::Repositories::Users.new(SknApp.config.rom)
    end

    # ##
    # Instance Methods
    # ##

    # Warden will call this methods
    def disable_authentication_controls
      self.last_access = Time.now.getlocal
      cache_provider_delete_user(attributes(:id))
      attributes(:active, false)
      # TODO: Save User object to keep last login/access time
      @user_proxy = nil
      true
    end

    # Warden will call this methods
    def enable_authentication_controls
      attributes(:active, true)
      self.last_access = Time.now.getlocal
      cache_provider_add_user(self)
      true
    end

    protected

    def debug_log(msg)
      @_upr_debug_logger ||= (Logging.logger['UPR'] || ::SknApp.logger)
      @_upr_debug_logger.info(msg)
    end

    private

    def last_login_time_expired?
      @login_after_seconds ||= SknSettings.security.verify_login_after_seconds.to_i
      time_is_up = TimeMath.sec.measure(Time.now.getlocal, last_access) > @login_after_seconds
      debug_log "#{self.name}##{__method__}() Returns => #{time_is_up}"
      time_is_up
    end

  end
end