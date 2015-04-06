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
      t.stats_options << '--list-undoc' if ENV["CI"].nil?
    end

    task :doc_cover do
      coverage_str = `bundle exec rake doc`.split(/\r?\n/)[-1]
      coverage = (/\d+\.\d+/.match coverage_str)[0].to_f
      if coverage < 80 then
        puts "Only #{coverage}% of documentation complete of required 80%"
        exit 1
      else
        puts "#{coverage}% of documentation complete"
      end
    end 
  rescue LoadError
    task :doc do
      puts "No Yard found, you are not able to build documentation"
    end

    task :doc_cover do
      puts "No Yard found, you are not able to build documentation coverage"
    end
  end
else
  task :doc do
    puts "You are running jruby, it is currently not possible to build docs with it"
  end

  task :doc_cover do
    puts "You are running jruby, it is currently not possible to build docs with it"
  end
end

