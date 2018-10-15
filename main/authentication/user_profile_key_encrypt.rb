# File: ./strategy/authentication/user_profile_key_encrypt.rb
#
# Handles: Encrypting and Decrypting Tokens and digested passwords
#
# Depends on #attributes and ROM #user_repo methods from UserProfile
#
module Authentication
  module UserProfileKeyEncrypt

    def self.included(klass)
      klass.extend EncryptClassMethods
    end

    module EncryptClassMethods
      # Returns true/false based on recorded digest matching unencrypted value
      def valid_digest?(digest, unencrypted)
        BCrypt::Password.new(digest).is_password?(unencrypted)
      end
    end

    def regenerate_remember_token!
      generate_unique_token(:remember_token)
      attributes(:remember_token_digest,
                 get_new_secure_digest(attributes(:remember_token)))
    end

    def generate_unique_token(column)
      user_repository = user_repo
      begin
        if column.to_s.eql?("remember_token")
          attributes(column,  generate_urlsafe_key)
        else
          attributes(column, generate_unique_key)
        end
      end while user_repository.find_by(column => attributes(column))
      true
    end

    def generate_urlsafe_key
      SecureRandom.urlsafe_base64    # returns a 22 char string
    end

    def generate_unique_key
      SecureRandom.hex(16)    # returns a 32 char string
    end

    def get_new_secure_digest(token)
      @_digest_strength ||= SknSettings.security.extra_digest_strength.to_i
      BCrypt::Password.create(token, cost: (BCrypt::Engine::MIN_COST + @_digest_strength))
    end

  end
end
