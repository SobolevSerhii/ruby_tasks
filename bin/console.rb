#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'
require_relative '../task_1/test'
require_relative '../task_2/test'

def reload!
  print 'Reloading...'
  Dir[File.expand_path(__dir__, '../task_1/**.rb')].each { |file| load file }
  Dir[File.expand_path(__dir__, '../task_2/**.rb')].each { |file| load file }
  print 'Done...'
end
Pry.start
