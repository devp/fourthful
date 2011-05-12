# load console_init.rb in irb to use the various libraries.

# FIXME: There should me a more elegant gem way to do this.

require 'rubygems'
require "bundler/setup"
Bundler.require(:default)
$:.unshift("#{File.dirname(__FILE__)}/lib")
$:.unshift("#{File.dirname(__FILE__)}/lib/fourthful")
require 'fourthful'