# ##
# File ./web/routes/profiles.rb
#

class SknWeb

  route('profiles') do |r|

    login_required?

    set_view_subdir 'profiles'

    r.get "users" do
      wrap_html_response(registry_service.user_detail, :users)
    end

    r.get "resources" do
      wrap_html_response(registry_service.resources, :resources)
    end

    r.get "api_get_demo_content_object" do
      wrap_send_file_response( registry_service.content, :not_found, :not_found )
    end

  end
end
