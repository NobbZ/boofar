require "trollop"
require "logger"

require 'boofar'

module Boofar
  class NewSite
    attr_reader :opts

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