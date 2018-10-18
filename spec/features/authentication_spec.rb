
# ##
# Have not figured out how to use the Application Session
# - redirect to original page is not working!
# ##


feature "Authentication process for all users."  do

  context "Public Pages can be accessed. " do

    scenario "#/ not required to sign in when page is unsecured." do
      visit '/'
      expect(current_path).to eq '/'
      expect(page).to have_title("Home")
    end

    scenario "#/about not required to sign in when page is unsecured." do
      visit '/about'
      expect(current_path).to eq '/about'
      expect(page).to have_title("About")
    end

    scenario "#/contact not required to sign in when page is unsecured." do
      visit '/contact'
      expect(current_path).to eq '/contact'
      expect(page).to have_title("Contact")
    end
  end

  context "Secured Pages cannot be accessed. " do

    scenario "#/profiles/resources Secured page requires sign in." do
      visit '/profiles/resources'
      expect(current_path).to eq '/sessions/unauthenticated'
      expect(page).to have_title("Not Authenticated")
      expect(page).to have_content('You must be signed In to view resources!')
    end

    scenario "#/profiles/users Secured page requires sign in." do
      visit '/profiles/users'
      expect(current_path).to eq '/sessions/unauthenticated'
      expect(page).to have_title("Not Authenticated")
      expect(page).to have_content('You must be signed In to view users!')
    end
  end

  context "Using good PASSWORD credentials. " do
    given(:user) { page_user_eptester }

    scenario "Sign in with username and password credentials." do
      stub_request(:get, "http://vserv.skoona.net:8080/profiles/api_in_action?username=eptester").
          with(
              headers: {
                  'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'Authorization'=>'Basic ZGV2ZWxvcGVyOmRldmVsb3Blcjk5',
                  'User-Agent'=>'Ruby'
              }).
          to_return(status: 200, body: "", headers: {})

      visit '/sessions/signin'
      fill_in 'sessions_username', :with =>  user.username
      fill_in 'sessions_password', :with =>  "demos"
      click_button 'Sign in'
      expect(current_path).to eq '/profiles/resources'
      expect(page).to have_title("Secured Resources")
    end

    scenario "Returned to originally requested page after signing in." do
      stub_request(:get, "http://vserv.skoona.net:8080/profiles/api_in_action?username=eptester").
          with(
              headers: {
                  'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'Authorization'=>'Basic ZGV2ZWxvcGVyOmRldmVsb3Blcjk5',
                  'User-Agent'=>'Ruby'
              }).
          to_return(status: 200, body: "", headers: {})

      visit '/profiles/users'
      expect(current_path).to eq '/sessions/unauthenticated'
      expect(page).to have_content('You must be signed In to view users!')
      visit '/sessions/signin'
      fill_in 'sessions_username', :with => user.username
      fill_in 'sessions_password', :with => "demos"
      click_button 'Sign in'

      expect(current_path).to eq '/profiles/resources'
      click_link 'Sign out'
    end

    scenario "Returned to Home page after sign out." do
      stub_request(:get, "http://vserv.skoona.net:8080/profiles/api_in_action?username=eptester").
          with(
              headers: {
                  'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'Authorization'=>'Basic ZGV2ZWxvcGVyOmRldmVsb3Blcjk5',
                  'User-Agent'=>'Ruby'
              }).
          to_return(status: 200, body: "", headers: {})

      visit '/profiles/users'
      expect(current_path).to eq '/sessions/unauthenticated'
      expect(page).to have_content('You must be signed In to view ')
      visit '/sessions/signin'
      fill_in 'sessions_username', :with => user.username
      fill_in 'sessions_password', :with => "demos"
      click_button 'Sign in'

      expect(current_path).to eq '/profiles/resources'
      click_link 'Sign out'
      expect(current_path).to eq '/'
      expect(page).to have_title("Home")
    end
  end

  context "Using bad credentials. " do
    given(:user) { page_user_eptester }

    scenario "Cannot sign in with incorrect username." do
      visit '/sessions/signin'
      fill_in 'sessions_username', :with => "LastNameInitial"
      fill_in 'sessions_password', :with => "demos"
      click_button 'Sign in'
      expect(current_path).to eq '/sessions/unauthenticated'
      expect(page).to have_title("Not Authenticated")
    end

    scenario "Cannot sign in with incorrect password." do
      visit '/sessions/signin'
      fill_in 'sessions_username', :with => user.username
      fill_in 'sessions_password', :with => "somebody"
      click_button 'Sign in'
      expect(current_path).to eq '/sessions/unauthenticated'
      expect(page).to have_title("Not Authenticated")
    end

    scenario "Cannot sign in when no credentials are offered." do
      visit '/sessions/signin'
      click_button 'Sign in'
      expect(current_path).to eq '/sessions/unauthenticated'
      expect(page).to have_title("Not Authenticated")
    end

  end

end