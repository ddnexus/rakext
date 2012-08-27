require 'rake'
require 'yaml'
require 'multi_json'

module Rakext
  module Tasks
    def self.included(base)
      base.class_eval do
        extend self
        @prefix = ( p = name.gsub('::', ':')
                    p.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
                    p.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
                    p.downcase!
                    "#{p}:" )
      end
    end

    def method_added(meth)
      return unless public_instance_methods.include?(meth) || public_instance_methods.include?(meth.to_sym)
      args = Rakext.get_args
      m    = method(meth.to_sym)
      Rake::Task.define_task("#{@prefix}#{meth}") do
        args.is_a?(Hash) ? m.call(args) : m.call(*args)
      end
    end

    def desc(description)
      Rake.application.last_description = description
    end

    def prefix(p=nil)
      p.nil? ? @prefix : @prefix = p
    end
  end

  def self.get_args
    case
    when ENV['RUBY_ARGS']
      a = ENV['RUBY_ARGS'].strip
      a = a[1..-2] if a =~ /^\(.*\)$/
      eval("echo(#{a})")
    when ENV['YAML_ARGS']
      YAML.load(ENV['YAML_ARGS'])
    when ENV['JSON_ARGS']
      MultiJson.decode(ENV['JSON_ARGS'])
    end
  end

private
  def self.echo(*a); a end

end

