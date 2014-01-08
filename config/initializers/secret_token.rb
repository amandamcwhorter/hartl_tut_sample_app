# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
#HartlTutSampleApp::Application.config.secret_token = 'e36c01b1dac0417dc18f97a2baf1c0c8d0dbddff74235b9bfcc783ad3bda4afca4f4dee0ab8ce861703a1ae6db3194f3f23097512a6bc7a7a0ebc89cb52c6719'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    #use existing token
    File.read(token_file).chomp
  else
    #generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

HartlTutSampleApp::Application.config.secret_key_base = secure_token