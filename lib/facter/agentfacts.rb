require 'facter'
require 'pry'

binding.pry
raw = ""
Facter::Core::Execution.with_env('PATH' => './') do
  raw = Facter::Core::Execution.execute('puppet config print')
end

config = {}
raw.each_line do |entry|
  entry_array = entry.split(' = ')
  config[entry_array[0]] = entry_array[1].chomp
end

config.each do |key, value|
  # Add a prefix to avoid name colisions
  Facter.add("agentfacts_#{key}") do
    setcode do
      value
    end
  end
end
