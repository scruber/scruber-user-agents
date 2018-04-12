require "thor"
require 'fileutils'

module Scruber
  module CLI
    class Generators < Thor

      class UserAgentsInstall < Thor::Group
        include Thor::Actions

        def check_for_project
          raise ::Thor::Error, "ERROR: Scruber project not found." unless defined?(APP_PATH)
        end
        
        def change_config
          comment_lines 'config/initializers/user_agents.rb', /add "/

          uncomment_lines 'config/initializers/user_agents.rb', /loop \:user_agents/
          uncomment_lines 'config/initializers/user_agents.rb', /add ua\['name'\]/
          uncomment_lines 'config/initializers/user_agents.rb', /end/
        end
      end

      register UserAgentsInstall, 'user_agents:install', 'user_agents:install', 'Install user agents'
    end
  end
end
