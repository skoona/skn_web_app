# File ./main/persistence/entities/topic_type.rb
#
# Output Records via Mapping
# - Has Many TopicTypeOpts

module Entities

  class TopicType < ROM::Struct

    attribute :opts, Types::Strict::Array.of(::Entities::TopicTypeOpt).optional

  end

end
