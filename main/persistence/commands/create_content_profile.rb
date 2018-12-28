# ##
#


module Commands

  class CreateContentProfile < ROM::SQL::Commands::Create
    relation :content_profiles
    register_as :create_content_profile

    def execute(tuple)
      if root.by_pak(tuple.person_authentication_key).exist?
        raise(PersonAuthenticationKeyNotUnique,
              "Key: #{tuple.person_authentication_key} is a duplicate!")
      end
      cs = root.changeset(:create, tuple).map(:add_timestamps)
      cs.commit(cs)
    end
  end
end