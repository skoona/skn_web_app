# ##
# File: ./strategy/services/content/models/resources.rb
#
# Holds the returned catalog of available files
# ##

module Services
  module Content
    module Models

      class Resources < SknUtils::NestedResult

      end

    end
  end
end

# ##
# METADATA-RESPONSE
# {
#   "package"=> {
#      "success"=>true,
#      "message"=>"",
#      "payload"=>{
#         "get_demo_content_object_url"=>"/profiles/api_get_demo_content_object",
#         "message"=>"",
#         "cp"=>{
#           "pak"=>"ae3f8c70291c127c45196c0358d9d7ab",
#           "profile_type"=>"BranchSecondary",
#           "profile_type_description"=>"Branch Staff",
#           "provider"=>"SknService::Bcrypt",
#           "username"=>"bstester",
#           "display_name"=>"Branch Secondary User",
#           "last_update"=>"2018-01-15 09:49:24 AM",
#           "email"=>"appdev3@localhost.com",
##          "entries"=>[
#             { "content_value"=>["*.pdf"],
#               "content_type"=>"Activity",
#               "content_type_description"=>"Partner Relationship Reports",
#               "topic_value"=>["0099"],
#               "topic_type"=>"Partner",
#               "topic_type_description"=>"This Corporate Account",
#               "description"=>"Partner Relationship Reports",
#               "last_update"=>"2018-01-15 09:49:23 AM",
#               "id"=>"content",
#               "username"=>"bstester",
#               "user_options"=>["BranchSecondary", "0037", "0099"],
#               "pak"=>"ae3f8c70291c127c45196c0358d9d7ab",
###             "content"=>[
#                 {
#                   "source"=>"Partner/0099/Activity",
#                   "filename"=>"About-SknServices.pdf",
#                   "created"=>"2017/10/17",
#                   "size"=>"387.0 KB",
#                   "mime"=>"application/pdf",
#                   "username"=>"bstester",
#                   "id"=>"0:0:0",
#                   "content_type"=>"Activity"
#                 },
#                 {"source"=>"Partner/0099/Activity", "filename"=>"SknServices-ArchitecturalDetails.pdf", "created"=>"2018/01/15", "size"=>"1.4 MB", "mime"=>"application/pdf", "username"=>"bstester", "id"=>"0:0:1", "content_type"=>"Activity"},
#                 {"source"=>"Partner/0099/Activity", "filename"=>"SkoonaConsulting-0099.pdf", "created"=>"2018/01/15", "size"=>"26.4 KB", "mime"=>"application/pdf", "username"=>"bstester",           "id"=>"0:0:2", "content_type"=>"Activity"},
#                 {"source"=>"Partner/0099/Activity", "filename"=>"SknServices-About.pdf", "created"=>"2018/01/15", "size"=>"329.6 KB", "mime"=>"application/pdf", "username"=>"bstester",              "id"=>"0:0:3", "content_type"=>"Activity"}
#               ]
#             },
#             { "content_value"=>["*.log"], "content_type"=>"FileDownload", "content_type_description"=>"Project Related Resources", "topic_value"=>["VendorPrimary"], "topic_type"=>"UserGroups", "topic_type_description"=>"Shared access to project working files", "description"=>"Shared access to project working files", "last_update"=>"2018-01-15 09:49:23 AM", "id"=>"content", "username"=>"bstester", "user_options"=>["BranchSecondary", "0037", "0099"], "pak"=>"ae3f8c70291c127c45196c0358d9d7ab",
###             "content"=>[
#                 {"source"=>"UserGroups/VendorPrimary/FileDownload", "filename"=>"logout-to-login.log", "created"=>"2018/01/15", "size"=>"21.7 KB", "mime"=>"text/plain", "username"=>"bstester",     "id"=>"0:0:0", "content_type"=>"FileDownload"}
#               ]
#             }
#           ]
#         },
#
##        "display_groups"=>[
#           {"content_value"=>["*.pdf"], "content_type"=>"Activity", "content_type_description"=>"Partner Relationship Reports", "topic_value"=>["0099"], "topic_type"=>"Partner", "topic_type_description"=>"This Corporate Account", "description"=>"Partner Relationship Reports", "last_update"=>"2018-01-15 09:49:23 AM", "id"=>"content", "username"=>"bstester", "user_options"=>["BranchSecondary", "0037", "0099"], "pak"=>"ae3f8c70291c127c45196c0358d9d7ab",
###               "content"=>[
#                   {"source"=>"Partner/0099/Activity", "filename"=>"About-SknServices.pdf", "created"=>"2017/10/17", "size"=>"387.0 KB", "mime"=>"application/pdf", "username"=>"bstester",              "id"=>"0:0:0", "content_type"=>"Activity"},
#                   {"source"=>"Partner/0099/Activity", "filename"=>"SknServices-ArchitecturalDetails.pdf", "created"=>"2018/01/15", "size"=>"1.4 MB", "mime"=>"application/pdf", "username"=>"bstester", "id"=>"0:0:1", "content_type"=>"Activity"},
#                   {"source"=>"Partner/0099/Activity", "filename"=>"SkoonaConsulting-0099.pdf", "created"=>"2018/01/15", "size"=>"26.4 KB", "mime"=>"application/pdf", "username"=>"bstester",           "id"=>"0:0:2", "content_type"=>"Activity"},
#                   {"source"=>"Partner/0099/Activity", "filename"=>"SknServices-About.pdf", "created"=>"2018/01/15", "size"=>"329.6 KB", "mime"=>"application/pdf", "username"=>"bstester",              "id"=>"0:0:3", "content_type"=>"Activity"}
#                 ]
#           },
#           {"content_value"=>["*.log"], "content_type"=>"FileDownload", "content_type_description"=>"Project Related Resources", "topic_value"=>["VendorPrimary"], "topic_type"=>"UserGroups", "topic_type_description"=>"Shared access to project working files", "description"=>"Shared access to project working files", "last_update"=>"2018-01-15 09:49:23 AM", "id"=>"content", "username"=>"bstester", "user_options"=>["BranchSecondary", "0037", "0099"], "pak"=>"ae3f8c70291c127c45196c0358d9d7ab",
###               "content"=>[
#                   {"source"=>"UserGroups/VendorPrimary/FileDownload", "filename"=>"logout-to-login.log", "created"=>"2018/01/15", "size"=>"21.7 KB", "mime"=>"text/plain", "username"=>"bstester",      "id"=>"0:0:0", "content_type"=>"FileDownload"}
#                 ]
#           }
#         ]
#      }
#   }
# }