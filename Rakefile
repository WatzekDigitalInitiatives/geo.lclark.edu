# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'solr_wrapper/rake_task' unless Rails.env.production?

Rails.application.load_tasks

# Clearing out the original rake test task that runs minitest
Rake::Task["test"].clear
Rake::Task["default"].clear

# test task to run spec tests
desc 'Execute the tests'
task :test => [:environment] do
  # required to start solr before capybara uses rails server
  require 'solr_wrapper'
  if Rails.env.test?
    Rake::Task['db:migrate'].invoke
    SolrWrapper.wrap do |solr|
      solr.with_collection(name: 'blacklight-core', dir: "#{Rails.root}/solr/conf") do
        Rake::Task['geoblacklight:solr:seed'].invoke
        Rake::Task['spec'].invoke
      end
    end
  else
    system('rake test RAILS_ENV=test')
  end
end

task :default => :test
