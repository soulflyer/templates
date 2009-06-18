# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_templatetest_session',
  :secret      => '7d64f1df20262d1cf78d788d04ffe15f7838602c86462404f345f6ba103805be37e9f9255907dfd19d27007b890ab73fca6d81658978a091c83ee0a445981e2c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
