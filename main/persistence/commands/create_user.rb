# ##
#


module Commands

  class CreateUser < ROM::SQL::Commands::Create
    relation :users
    register_as :create_user

    def execute(tuple)
      if !!root.by_pak(tuple.person_authentication_key)
        raise(PersonAuthenticationKeyNotUnique,
              "Key: #{tuple.person_authentication_key} is a duplicate!")
      end
      cs = root.changeset(:create, tuple).map(:add_timestamps)
      cs.commit(cs)
    end
  end
end