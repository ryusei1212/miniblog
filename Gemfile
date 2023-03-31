source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

gem 'rails', '7.0.4'

gem 'active_storage_validations'
gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'devise'
gem 'devise-i18n'
gem 'haml-rails'
gem 'image_processing'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'pg'
gem 'puma'
gem 'simple_form'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'whenever', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'sgcop', github: 'SonicGarden/sgcop'
end

group :development do
  gem 'bullet'
  gem 'faker'
  gem 'html2haml'
  gem 'letter_opener_web'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'email_spec'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'dockerfile-rails', '>= 1.2', group: :development # fly launch コマンド実行後に追加された
