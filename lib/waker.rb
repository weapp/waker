#!/usr/bin/env ruby

class Waker
  attr_accessor :actions

  def initialize actions={}, &block
    self.actions = actions.map do |matcher, action|
      Matcher.new(matcher, action)
    end
    if block_given?
      instance_eval(&block)
    end
  end

  def start
    loop do
      tick
      begin
        sleep until_next_minute
      rescue Interrupt
        puts
        exit
      end
    end
  end

  def until_next_minute
    60 - Time.now.to_f % 60
  end

  def tick
    puts
    puts "#{Time.now} - #{formated_time}"
    actions.each { |action| action.call formated_time }
  end

  def formated_time time=Time.now
    time.strftime('%FT%RW%u%a')
  end

  def at regexp, &block
    self.actions << Matcher.new(regexp, block)
  end
end


class Matcher
  attr_accessor :match, :action

  def initialize match, action
    self.match = Regexp.new(match)
    self.action = action
  end

  def match? string
    match =~ string
  end

  def call string
    action.call(string) if match? string
  end
end