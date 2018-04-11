RSpec.describe Scruber::User::Agents do
  it "has a version number" do
    expect(Scruber::User::Agents::VERSION).not_to be nil
  end

  it "adds new user_agents dictionary to scruber" do
    Scruber::Core::Extensions::Loop._registered_dictionaries.keys.include?(:user_agents)
  end


  context "sample" do
    before do
      Scruber::Helpers::UserAgentRotator.configure do
        clean
        set_filter :all

        loop :user_agents do |ua|
          add ua['name'], tags: ua['tags'].split(',').map(&:strip)
        end
      end
    end
    
    it "adds user agents to list" do
      expect(Scruber::Helpers::UserAgentRotator.configuration.user_agents.count).to be > 0
    end

  end
end
