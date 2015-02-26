#!/usr/bin/env ruby

module OsascriptAdapter
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods

    def commands *names
      names.each do |name|
        define_method(name) do
          call name_to_script(name)
        end
      end
    end

    def functions *names
      names.each do |name|
        define_method(name) do |arg|
          call "#{name_to_script(name)} #{escape(arg)}"
        end
      end
    end

    def setters *names
      names.each do |name|
        define_method("#{name}=") do |value|
          call "set #{name_to_script(name)} to #{escape(value)}"
        end
      end
    end
  end

  def osascript command
    `osascript -e '#{command}'`
  end

  def call_with_log command
    puts "#{command} => #{call(command).inspect}"
  end

  def call command
    parse_output(osascript("tell application \"#{self.class.name}\" to #{command}"))
  end

  def parse_output output
    out = output.strip
    case out
      when /\A[0-9]+\Z/
        out.to_i
      when /\A[0-9]+\.[0-9]+\Z/
        out.to_f
      when "false"
        false
      when "true"
        true
      when ""
        nil
      else
        out
    end

  end

  def name_to_script name
    name.to_s.gsub("_", " ")
  end

  def escape name
    name.inspect
  end
  
end
