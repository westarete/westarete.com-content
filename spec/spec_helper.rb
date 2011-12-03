[
  "/../lib/**/*.rb",
  "/support/**/*.rb"
].each do |path|
  Dir[File.dirname(__FILE__) + path].each { |f| require f }
end

require 'shoulda/matchers/integrations/rspec'
