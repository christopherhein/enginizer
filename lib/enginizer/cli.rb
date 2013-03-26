require 'rubygems'
require 'thor'

require "enginizer/extension"
require "enginizer/app"

module Enginizer
  class Cli < Thor
    include Thor::Actions
    
    register Enginizer::Extension, :engine, "engine NAME", "Bootstraps a new engine for development."
    register Enginizer::App, :new, "app NAME", "Bootstraps a new enginized application."
    
  end
end