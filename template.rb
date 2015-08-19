require 'bundler'

@app_name = app_name

# pager
gem 'kaminari'

# image uploader
# gem 'CarrierWave'
# gem 'fog'
# gem 'paperclip'

@need_jq = yes?("need jobqueue gem? [y/n]")
if @need_jq
  case ask("choose a gem: resque[1] / sidekiq[2] or ELSE(skip)")
  when 'resque', '1'
    gem 'resque', '~> 1.25.2'
  when 'sidekiq', '2'
    gem 'sidekiq', '~> 3.4.2'
  else
  end
end

# configration
# gem 'rails_config'
# gem 'settings_logic'
# gem 'global'

# template
gem 'haml-rails', '~> 0.9.0'
gem 'cells', '~> 4.0.2'

# cron management
gem 'whenever', '~> 0.9.4'

# authentication
gem 'devise', '~> 3.5.2'
gem 'devise_ldap_authenticatable', '~> 0.8.5'

# decorator
gem 'draper'

gem 'bootstrap-sass', '~> 3.3.5.1'
gem 'bootswatch-sass', '~> 3.3.5'
gem 'font-awesome-rails', '~> 4.4.0.0'

gem_group :development do
  gem 'html2haml', '~> 2.0.0'

  # insert source_map for partial view
  gem 'view_source_map'

  # replace REPL tool from irb
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'

  gem 'better_errors'
  gem 'binding_of_caller'

  # no need assets log
  gem 'quiet_assets'

  # profiling
  gem 'rack-mini-profiler'

  # detect N+1 problem
  gem 'bullet'

  # annotate model schema
  gem 'annotate'

  gem 'awesome_print', require: 'ap'
end

gem_group :development, :test do
  # security scanner
  gem 'brakeman', '~> 3.0.5', require: false
end


@turbolinks_off = yes?("turbolinks off?[y/n]") ? true : false

if @turbolinks_off
  gsub_file 'Gemfile', /^(gem 'turbolinks')$/, '# \1'
  gsub_file 'app/views/layouts/application.html.erb', /,\s*'data-turbolinks-track' => true/, ''
  gsub_file 'app/assets/javascripts/application.js', %r!^//=.+turbolinks\n!, ''
end

Bundler.with_clean_env do
  run "bundle install --path ./vendor/bundle --jobs=4"
end

after_bundle do
  # convert all erb file to haml
  rake "haml:erb2haml"
  generate "kaminari:config"
end

run "rm README.rdoc"
create_file "README.md" do
  "# Hello! #{@app_name} application"
end
