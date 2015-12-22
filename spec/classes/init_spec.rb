require 'spec_helper'
describe 'agentfacts' do

  context 'with defaults for all parameters' do
    it { should contain_class('agentfacts') }
  end
end
