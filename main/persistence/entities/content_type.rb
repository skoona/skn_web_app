# File ./main/persistence/entities/content_type.rb
#
# Output Records via Mapping
# - Has many ContentTypeOpt

module Entities

  class ContentType < ROM::Struct

    attribute :content_type_opts, Types::Strict::Array.of(::Entities::ContentTypeOpt).optional

  end

end
