require 'spec_helper'

describe BoketeApiWrapper::Configuration do
  let(:configuration) { BoketeApiWrapper::Configuration.new }

  describe :initialize do
    context :host do
      it { expect(configuration.host).to eq("bokete.jp")}
    end

    context :user_agent do
      it { expect(configuration.user_agent).to eq("BoketeApiWrapper Ruby Gem #{BoketeApiWrapper::VERSION}")}
    end
  end

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