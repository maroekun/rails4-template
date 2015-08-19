require 'bundler'

@app_name = app_name

# pager
gem 'kaminari'

# image uploader
# gem 'CarrierWave'
# gem 'fog'
# gem 'paperclip'

# job queue
# gem 'rescue'
# gem 'sidekiq'

# configration
# gem 'rails_config'
# gem 'settings_logic'
# gem 'global'

# template
gem 'haml-rails', '~> 0.9.0'
gem 'cells', '~> 4.0.2'

# cron management
# gem 'whenever'

# authentication
# gem 'devise'

# decorator
gem 'draper'

# !!CAUTION!!
# gem 'squeel'

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

# copy_file sample
# copy_file File.expand_path("hoge", File.dirname(__FILE__)), "hoge"

@turbolinks_off = yes?("turbolinks off?[y/n]") ? true : false

if @turbolinks_off
  gsub_file 'Gemfile', /^(gem 'turbolinks')$/, '# \1'
  gsub_file 'app/views/layouts/application.html.erb', /,\s*'data-turbolinks-track' => true/, ''
  gsub_file 'app/assets/javascripts/application.js', %r!^//=.+turbolinks\n!, ''
end

# run "bundle install --path ./vendor/bundle"
run "rm README.rdoc"
create_file "README.md" do
  "# Hello! #{@app_name} application"
end

# convert all erb file to haml
# rake "haml:erb2haml"
