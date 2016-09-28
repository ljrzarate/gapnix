Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '973395063318-lcov8tpcuptuvp3g43q0ai2k76ege6dh.apps.googleusercontent.com','gs2pcBjEX8Boy_nACOEOey4r', {
#   scope: ['profile',
#     'https://www.googleapis.com/auth/gmail.modify'],
    scope: 'profile',
    # redirect_uri: 'http://localhost:3000/authp',
    redirect_uri: 'http://localhost:3000/users/auth/google_oauth2/callback'
    
    }
end