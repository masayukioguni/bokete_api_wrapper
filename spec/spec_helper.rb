$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'bokete_api_wrapper'
require 'webmock/rspec'
require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter '.bundle/'
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.before { example.example_group.let(:mock_user) { build(:user) } }

  BoketeApiWrapper.setup do |conf|
    conf.dev = true
  end

  def mock_file(file)
    File.read File.join(File.expand_path('../support', __FILE__), file)
  end
end

