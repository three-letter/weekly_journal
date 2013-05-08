# -*- encoding : utf-8 -*-
# Be sure to restart your server when you modify this file.

Techplatform::Application.config.session_store :cookie_store, key: '_Techplatform_session'#, :expire_after => 2.seconds

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Techplatform::Application.config.session_store :active_record_store
