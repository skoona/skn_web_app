# ##
#
# Handle Temporary File Response
# Services::Handlers::UserDetail

module Services
  module Handlers

    class UserDetail
      def self.call(person_authentication_key, options={})
        self.new(options).call(person_authentication_key)
      end

      def initialize(options={})
        @_user_repo = options.fetch('user_repo', Repositories::Users.new(SknApp.rom) )
      end

      def call(pak)
        SknSuccess.call( collect_details(pak) )
      end

      def collect_details(pak)
        rec  = @_user_repo.with_profiles(pak)&.to_h
        cp   = rec.delete(:content_profiles)
        cpe  = cp&.delete(:content_profile_entries)
        acc  = rec.delete(:assigned_roles)
        acc += rec.delete(:user_options)

        {
            user: {
                name:       rec[:name],
                username:   rec[:username],
                email:      rec[:email],
                created_at: rec[:created_at],
                updated_at: rec[:updated_at],
                active:     rec[:active]
            },
            access_profile:  acc || [],
            content_profile: cp || {},
            content_profile_entries: cpe || []
        }
      end

    end # end class
  end
end

# ##
# Data Source
# ##
# {:id=>4,
#  :username=>"estester",
#  :name=>"Employee Secondary User",
#  :email=>"appdev1@localhost.com",
#  :password_digest=>"$2a$10$ogHFpVNVmWWIIG2CEkNpEuAo2uZD0m01zlVEodeq2llicfb3mJcty",
#  :remember_token=>"35eFxY4lDZSmdoDF0I_07w",
#  :password_reset_token=>nil,
#  :password_reset_date=>nil,
#  :assigned_groups=>["EmployeeSecondary"],
#  :roles=>[],
#  :active=>true,
#  :file_access_token=>nil,
#  :created_at=>2018-01-15 14:48:55 -0500,
#  :updated_at=>2018-01-15 14:48:55 -0500,
#  :person_authentication_key=>"a1efb66f26e07a94dd893c085823f2ad",
#  :assigned_roles=>[],
#  :remember_token_digest=>"$2a$07$Ual2Sr7SRT95QQ8tu0pKwuryjTVwyOGNPnzA0q78DV/iKXOoynOLW",
#  :user_options=>["EmployeeSecondary", "0037", "0099"],
#  :content_profiles=>
#      {:id=>4,
#       :person_authentication_key=>"a1efb66f26e07a94dd893c085823f2ad",
#       :profile_type_id=>4,
#       :authentication_provider=>"SknService::Bcrypt",
#       :username=>"estester",
#       :display_name=>"Employee Secondary User",
#       :email=>"appdev1@domain.com",
#       :created_at=>2018-01-15 14:48:58 -0500,
#       :updated_at=>2018-01-15 14:48:58 -0500,
#       :profile_type=>{:id=>4, :name=>"EmployeeSecondary", :description=>"Corporate Staff", :created_at=>2018-01-15 14:48:56 -0500, :updated_at=>2018-01-15 14:48:56 -0500},
#       :content_profile_entries=>
#           [{:id=>47,
#             :topic_value=>["0034"],
#             :topic_type=>"Branch",
#             :topic_type_description=>"Branch Actions for a specific branch",
#             :content_value=>["*.pdf"],
#             :content_type=>"Experience",
#             :content_type_description=>"Monthly Experience Reports and Files",
#             :description=>"Branch Experience Statements",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4},
#            {:id=>48,
#             :topic_value=>["0034"],
#             :topic_type=>"Branch",
#             :topic_type_description=>"Branch Actions for a specific branch",
#             :content_value=>["*.pdf"],
#             :content_type=>"Commission",
#             :content_type_description=>"Monthly Commission Reports and Files",
#             :description=>"Access Branch Commission PDF Files",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4},
#            {:id=>49,
#             :topic_value=>["0034"],
#             :topic_type=>"Branch",
#             :topic_type_description=>"Branch Actions for a specific branch",
#             :content_value=>["AdvCancel"],
#             :content_type=>"Notification",
#             :content_type_description=>"Email Notification of Related Events",
#             :description=>"Notify Branch of Policy Events",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4},
#            {:id=>50,
#             :topic_value=>["0099"],
#             :topic_type=>"Partner",
#             :topic_type_description=>"This Corporate Account",
#             :content_value=>["*.pdf"],
#             :content_type=>"Activity",
#             :content_type_description=>"Partner Relationship Reports",
#             :description=>"Partner Relationship Reports",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4},
#            {:id=>51,
#             :topic_value=>["0040"],
#             :topic_type=>"Branch",
#             :topic_type_description=>"Branch Actions for a specific branch",
#             :content_value=>["*.pdf"],
#             :content_type=>"Experience",
#             :content_type_description=>"Monthly Experience Reports and Files",
#             :description=>"Branch Experience Statements",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4},
#            {:id=>52,
#             :topic_value=>["0040"],
#             :topic_type=>"Branch",
#             :topic_type_description=>"Branch Actions for a specific branch",
#             :content_value=>["*.pdf"],
#             :content_type=>"Commission",
#             :content_type_description=>"Monthly Commission Reports and Files",
#             :description=>"Access Branch Commission PDF Files",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4},
#            {:id=>53,
#             :topic_value=>["0040"],
#             :topic_type=>"Branch",
#             :topic_type_description=>"Branch Actions for a specific branch",
#             :content_value=>["FutCancel"],
#             :content_type=>"Notification",
#             :content_type_description=>"Email Notification of Related Events",
#             :description=>"Notify Branch of Policy Events",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4},
#            {:id=>54,
#             :topic_value=>["EmployeeSecondary"],
#             :topic_type=>"UserGroups",
#             :topic_type_description=>"Shared access to project working files",
#             :content_value=>["*.pdf"],
#             :content_type=>"FileDownload",
#             :content_type_description=>"Project Related Resources",
#             :description=>"Shared access to project working files",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4},
#            {:id=>55,
#             :topic_value=>["BranchPrimary"],
#             :topic_type=>"UserGroups",
#             :topic_type_description=>"Shared access to project working files",
#             :content_value=>["*.pdf"],
#             :content_type=>"FileDownload",
#             :content_type_description=>"Project Related Resources",
#             :description=>"Shared access to project working files",
#             :created_at=>2018-01-15 14:48:58 -0500,
#             :updated_at=>2018-01-15 14:48:58 -0500,
#             :content_profile_id=>4}]}}
