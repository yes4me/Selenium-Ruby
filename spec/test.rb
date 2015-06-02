require 'yaml'
raw_config = File.open("config.yml")
CONFIG = YAML.load_file(raw_config)

puts "password is #{CONFIG['password']}\n"