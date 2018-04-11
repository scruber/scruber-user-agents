require 'scruber'
require "scruber/user/agents/version"
require "scruber/user/agents/cli/generators"

module Scruber
  module User
    module Agents
      Scruber::Core::Extensions::Loop.add_dictionary(:user_agents, File.expand_path(File.dirname(__FILE__))+'/../../../base/user_agents.csv', :csv)
    end
  end
end
