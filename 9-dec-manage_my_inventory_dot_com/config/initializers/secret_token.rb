# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.


if Rails.env.production?
  token = ENV.fetch 'SECRET_TOKEN'
else
  token = '11af3a6813a9de53b70e26585597c00dd368e16be7d8448a0195a1fcf266d1c31fcd7700640c50142ae51d1364b61af9d6daacd56b81e83cc56f2e7f0a081d94'
end

ManageMyInventoryDotCom::Application.config.secret_token = token
