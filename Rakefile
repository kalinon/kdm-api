# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb', 'app/**/*.rb'] # optional
  t.options = %w[--private] # optional
  t.stats_options = ['--list-undoc'] # optional
end
