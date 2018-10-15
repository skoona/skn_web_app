# ##
# File: ./strategy/services/content/models/catalog.rb
#
# Expected Key/Values
#  {
#     success: true,
#     message: "Source Duration: #{response['x-runtime']} seconds",
#     content_type: response['content-type'],
#     request_id: response['x-request-id'],
#     filename: real_filename,
#     content_disposition: response['content-disposition'],
#     payload: tmp_filename
#  }
# ##

module Services
  module Content
    module Models

      class Content < SknUtils::NestedResult

      end

    end
  end
end

