require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  desc "Run specs"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  desc "Run specs"
  task :spec do
    puts "No RSpec found, you are not able to run tests"
  end
end

if RUBY_PLATFORM != 'java' then
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
  rescue LoadError
    task :doc do
      puts "No Yard found, you are not able to build documentation"
    end
  end
else
  task :doc do
    puts "You are running jruby, it is currently not possible to build docs with it"
  end

  task :yardstick do
    puts "You are running jruby, it is currently not possible to build docs with it"
  end
end

