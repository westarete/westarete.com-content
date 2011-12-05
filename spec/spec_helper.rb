[
  "/../lib/**/*.rb",
  "/support/**/*.rb"
].each do |path|
  Dir[File.dirname(__FILE__) + path].each { |f| require f }
end

require 'shoulda/matchers/integrations/rspec'

RSpec.configure do |config|
  config.before(:each) do
    [Contribution, Person, Project, Service].each do |model|
      model.all.clear
    end
  end
end
