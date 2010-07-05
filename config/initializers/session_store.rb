# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simple_desk_session',
  :secret      => '731698274a9795969c286a07cd2f7334073549377e094632feca4998f159bad19d84df48784b5250b5b79d327afb73bb1fbe8c2892cef80366974c7cf3861f52'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
