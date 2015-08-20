require 'bundler'

@app_name = app_name

run "rm README.rdoc"
create_file "README.md" do
  "# Hello! #{@app_name} application"
end

@turbolinks_off = yes?("turbolinks off?[y/n]") ? true : false
if @turbolinks_off
  gsub_file 'Gemfile', /^(gem 'turbolinks')$/, '# \1'
  gsub_file 'app/views/layouts/application.html.erb', /,\s*'data-turbolinks-track' => true/, ''
  gsub_file 'app/assets/javascripts/application.js', %r!^//=.+turbolinks\n!, ''
end

@need_jq = yes?("need jobqueue gem? [y/n]")
if @need_jq
  @worker = case ask("choose a gem: resque[1] / sidekiq[2] or ELSE(skip)")
  when 'resque', '1'
    %q!gem 'resque', '~> 1.25.2'!
  when 'sidekiq', '2'
    %q!gem 'sidekiq', '~> 3.4.2'!
  else
    nil
  end
end

append_file 'Gemfile', <<GEMS
# * * * * * * * * * * * * * * * * * * *
#   Add Gems from ApplicationTemplate
# * * * * * * * * * * * * * * * * * * *

#{ %(# JobQueue) << "\n" << @worker << "\n" if @worker }
# Pagination
gem 'kaminari', '~> 0.16.3'

# bootstarp & font-awesome
gem 'bootstrap-sass', '~> 3.3.5.1'
gem 'bootswatch-sass', '~> 3.3.5'
gem 'font-awesome-rails', '~> 4.4.0.0'

# Use Haml template
gem 'haml-rails', '~> 0.9.0'

# For devide logic from controllers and views
gem 'cells', '~> 4.0.2'

# Cron management
gem 'whenever', '~> 0.9.4'

# Presentor base
gem 'draper', '~> 2.1.0'

group :development do
  # Detect N+1 problem
  gem 'bullet', '~> 4.14.7'

  # Security scanner
  gem 'brakeman', '~> 3.0.5', require: false

  # Profiling
  gem 'rack-mini-profiler', '~> 0.9.7'

  # Insert partial-view's source_map
  gem 'view_source_map', '~> 0.1.0'

  # Cool error page
  gem 'better_errors', '~> 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'

  # Replace irb with pry
  gem 'pry', '~> 0.10.1'
  gem 'pry-byebug', '~> 3.2.0'
  gem 'pry-rails', '~> 0.3.4'

  # Insert annotator
  gem 'annotate', '~> 2.6.10'

  # Clean rails log
  gem 'quiet_assets', '~> 1.1.0'

  # Beautify print
  gem 'awesome_print', '~> 1.6.1', require: 'ap'
end

group :development, :test do
  gem 'rspec-rails'
end
GEMS

# Remove `byebug`
gsub_file 'Gemfile', /^\s+(# Call|gem) 'byebug'.*\n{1,2}/, ''

Bundler.with_clean_env do
  run "bundle install --path ./vendor/bundle --jobs=4"
end

# convert template
rake "haml:erb2haml"

# cerate kaminari configration
generate "kaminari:config"
generate "rspec:install"
generate "annotate:install"

Bundler.with_clean_env do
  run 'bundle exec wheneverize .'
end

insert_into_file 'config/environments/development.rb', %(
  # Bullet configuration
  config.after_initialize do
    Bullet.enable  = true
    Bullet.alert   = true
    Bullet.console = true
    Bullet.bullet_logger = true
    Bullet.rails_logger  = true
  end
), after: 'Rails.application.configure do'

after_bundle do
end
