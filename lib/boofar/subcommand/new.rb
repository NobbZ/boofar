require "trollop"
require "logger"

require 'boofar'

module Boofar
  # Handles the subcommand `new`
  #
  # @since 0.0.1
  # @author Norbert Melzer <timmelzer@gmail.com>
  class NewSite
    attr_reader :opts
    # @!attribute [r] opts
    #   @return [Hash{Symbol => Object}] Options mapped to their value
    #   @since 0.0.1
    #   @author Norbert Melzer <timmelzer@gmail.com>

    # Initializes the {NewSite}
    #
    # @param [Array<String>] args Arguments that are passed through to the subcommand
    # @author Norbert Melzer <timmelzer@gmail.com>
    def initialize args
      @opts = Trollop::options args do
        banner <<-EOS
Usage:
    boofar new <site name> [options]

Creates a folder named <site name> and creates also an empty site skeleton.

Where [options] are
EOS
      
        opt :folder, "Overrides folder name, usefull when <site name> contains spaces or other special characters", type: :string
        opt :git,    "Creates a git repository", type: :flag, default: true
      end
    end
  end
end