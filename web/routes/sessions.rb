# ##
# File ./web/routes/users.rb
#

class SknWeb

  route 'sessions' do |r|

    set_view_subdir 'sessions'

    r.on 'signin' do

      r.post do
        # request.params[:sessions] => {
        #   "username"=>"developer",
        #   "password"=>"developer99",
        #   "remember_me_token"=>"1"
        # }
        authenticate!(:password)
        r.redirect(redirect_to_origin)
      end

      r.get do
        response.status = :accepted
        view(:signin)
      end
    end

    r.is 'logout' do
      logout
      flash_message(:success, "You have been signed out!")
      r.redirect request.base_url
    end

    r.is 'unauthenticated' do
      response.status = :not_acceptable
      view(:unauthenticated)
    end

  end
end


