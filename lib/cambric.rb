require 'erb'
require 'yaml'

module Cambric
  
  def self.config
    @config
  end
  
  def self.load_config(path)
    @config = YAML::load(ERB.new(IO.read(path)).result)
  end
  
  def self.push_design_docs
    
  end
  
end