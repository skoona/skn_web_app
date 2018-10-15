module TestUsers

  ##
  # Valid DB User with cached enablement  - i.e. findable by warden deserialization
  def user_developer
    UserProfile.find_and_authenticate("developer", "developer99")
  end
  def user_eptester
    UserProfile.find_and_authenticate("eptester", "demos")
  end
  def user_estester
    UserProfile.find_and_authenticate("estester", "demos")
  end
  def user_bptester
    UserProfile.find_and_authenticate("bptester", "demos")
  end
  def user_bstester
    UserProfile.find_and_authenticate("bstester", "demos")
  end
  def user_bnptester
    UserProfile.find_and_authenticate("bnptester", "demos")
  end
  def user_vptester
    UserProfile.find_and_authenticate("vptester", "demos")
  end
  def user_vstester
    UserProfile.find_and_authenticate("vstester", "demos")
  end

  ##
  # Valid DB User without cached enablement
  def page_user_developer
    UserProfile.page_user("developer")
  end
  def page_user_eptester
    UserProfile.page_user("eptester")
  end
  def page_user_estester
    UserProfile.page_user("estester")
  end
  def page_user_bptester
    UserProfile.page_user("bptester")
  end
  def page_user_bstester
    UserProfile.page_user("bstester")
  end
  def page_user_bnptester
    UserProfile.page_user("bnptester")
  end
  def user_vptester
    UserProfile.page_user("vptester")
  end
  def user_vstester
    UserProfile.page_user("vstester")
  end
end