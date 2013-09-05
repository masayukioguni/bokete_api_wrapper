$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'bokete_api_wrapper'

require 'factory_girl'
require 'webmock/rspec'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.include FactoryGirl::Syntax::Methods
  config.before { example.example_group.let(:mock_user) { build(:user) } }

  FactoryGirl.find_definitions

  Niconico.setup do |conf|
    conf.site_id = :site
    conf.salt = :salt
    conf.dev = true
  end

  def mock_file(file)
    File.read File.join(File.expand_path('../support', __FILE__), file)
  end
end

