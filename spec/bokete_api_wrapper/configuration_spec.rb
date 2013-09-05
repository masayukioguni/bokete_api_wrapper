require 'spec_helper'

describe BoketeApiWrapper::Configuration do
  let(:configuration) { BoketeApiWrapper::Configuration.new }

  describe :development? do
    context :default do
      it { expect(configuration).not_to be_dev }
    end
    context :dev=, true do
      before { configuration.dev = true }
      it { expect(configuration).to be_dev }
    end
  end
end