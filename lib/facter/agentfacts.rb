require 'facter'

settings = Puppet.settings.to_h
settings.each do |key, value|
  Facter.add("agentfacts_#{key}") do
    setcode do
      value.value
    end
  end
end