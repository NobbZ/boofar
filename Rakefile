require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

begin
  require "yard"
  YARD::Rake::YardocTask.new(:doc) do |t|
    t.files    = ['lib/**/*.rb']
    t.files   += ['-', 'README.md',
                      'LICENSE.txt',
                      'CODE_OF_CONDUCT.md']
    t.options  = ['--markup-provider=redcarpet',
                  '--markup', 'markdown']
  end
rescue
end
