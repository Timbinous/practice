require 'bundler/setup'
require 'resque'
require_relative 'word_analyzer'
module Rickshaw
  module Tps
    class OutboundOrder
      @queue = 'tps_outbound_order'
    end

    class InboundOrder
      @queue = 'tps_inbound_order'
    end
  end
end

idea = ARGV
puts "Analyzing your idea: #{idea.join(" ")}"
idea.each do |word|
  puts "Asking for a job to analyze: #{word}"
  Resque.enqueue(Rickshaw::Tps::OutboundOrder, word)
  Resque.enqueue(Rickshaw::Tps::InboundOrder, word)
end

