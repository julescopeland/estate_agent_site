# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_estate_agent_site_session',
  :secret      => '6f479a617f695590c93e973f2cad4298ee0899ab80588dabc1efebd55b0489ea297d4f11391c0cbcd38cf90be78e0e803f5bf688c012fecaf1b5573e1a1e97e1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
