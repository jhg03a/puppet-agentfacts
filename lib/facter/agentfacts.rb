require 'facter'

raw = Facter::Core::Execution.execute('puppet config print')
config = {}
raw.each_line{ |entry|
  entry_array = entry.split(" = ")
  config[entry_array[0]] = entry_array[1].chomp
}

config.each{ |key,value|
  # Add a prefix to avoid name colisions
  Facter.add("agentfacts_#{key}") do
    setcode do
      value
    end
  end
}