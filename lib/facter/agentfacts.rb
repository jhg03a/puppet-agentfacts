require 'facter'

# Pull in puppet settings from global variable
settings = Puppet.settings.to_h

# Resolve setting values to their bare value instead of the puppet setting class
pretty_settings = {}
settings.each do |key, value|
  pretty_settings[key] = value.value
end

# Build agentfacts structured fact
Facter.add("agentfacts") do
  setcode do
    pretty_settings
  end
end