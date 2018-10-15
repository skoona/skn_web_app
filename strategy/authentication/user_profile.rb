# File: ./strategy/authentication/user_profile.rb
#
# Primary User Object and/or contents of CurrentUser
# ##

class UserProfile < Authentication::UserProfileAuthenticator

  attr_accessor :last_access

  def initialize(user_obj)
    @attributes = user_obj.to_h
    @user_proxy = user_obj
    @last_access = Time.now.getlocal
  end

  # primary interface
  def attributes(attr, new_value=nil)
    new_value.nil? ? @attributes[attr.to_sym] : (@attributes[attr.to_sym] = new_value)
  end

  # Hash Notation
  def [](name)
    @attributes[name.to_sym]
  end
  def to_h
    @attributes.to_h
  end

  def active?
    @attributes[:active]
  end

  protected

  # Dot Notation
  def respond_to_missing?(method, _incl_private=false)
    @attributes.member?(method) || super
  end

  private

  # Dot Notation
  def method_missing(method, *_args, &_block)
    if @attributes.member?(method)
      @attributes[method]
    elsif method.to_s[-1].eql?('?')
      @attributes.member?(method.to_s[0..-2].to_sym)
    else
      super
    end
  end

end
