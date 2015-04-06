require 'logger'
require 'trollop'

require 'boofar'

module Boofar
  # Runner for the commandline tool
  #
  # @since 0.0.1
  # @author Norbert Melzer <timmelzer@gmail.com>
  class CLI
    VERSION_LINE = "boofar v#{Boofar::VERSION} (c) 2015 Norbert Melzer"
    SUB_COMMANDS = %w(new deploy build watch)

    private_constant :VERSION_LINE
    private_constant :SUB_COMMANDS

    # @author Norbert Melzer <timmelzer@gmail.com>
    def initialize args
      # Initialize the logger
      @logger = Logger.new(STDOUT)
      
      # Read global options
      read_global_opts args

      # set logger level according to set global opts
      @logger.level = if @global_opts[:verbose] then
        Logger::DEBUG
      elsif @global_opts[:quiet] then
        Logger::WARN
      else
        Logger::INFO
      end

      cmd = args.shift
      if cmd.nil? then
        Trollop::educate
      elsif SUB_COMMANDS.find_index(cmd).nil?
        puts "Unknown subcommand #{cmd}"
        Trollop::educate
      else
        @sub = "Boofar::#{cmd.upcase_first}Site".to_constant.new args
      end
    end

  private
    def read_global_opts args
      @global_opts = Trollop::options args do
        version VERSION_LINE
        banner <<-EOS
boofar is a static site generator.

Usage:
    boofar [global options]
    boofar [global options] new <site name> [options]
    boofar [global options] deploy <target> [options]
    boofar [global options] build [options]
    boofar [global options] watch [options]
where [global options] are

Information about boofar:
EOS

  opt :version, "Print version and exit"
  opt :help,    "Show this message"

  banner <<-EOS

Controlling verbosity (one of):
EOS

        opt :verbose,     "Activate verbose output",      type: :flag, short: 'V'
        opt :informative, "Standard amount of output",    type: :flag, short: 'I'
        opt :quiet,       "Surpress (nearly) all output", type: :flag, short: 'Q'
        conflicts :verbose, :quiet, :informative

        stop_on SUB_COMMANDS
      end
    end
  end
end