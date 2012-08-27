require 'date'

Gem::Specification.new do |s|
  s.name                      = 'rakext'
  s.authors                   = ["Domizio Demichelis"]
  s.email                     = 'dd.nexus@gmail.com'
  s.homepage                  = 'http://github.com/ddnexus/ake'
  s.summary                   = 'Lite and powerful rake extension'
  s.description               = 'Rakext allows you to create rake tasks by just writing methods. Besides, you can pass tasks arguments as ruby code, YAML or JSON strings and they will be evaluated as you expect.'
  s.executables               = ['rakext']
  s.extra_rdoc_files          = ["README.md"]
  s.require_paths             = ["lib"]
  s.files                     = `git ls-files -z`.split("\0")
  s.version                   = File.read(File.expand_path('../VERSION', __FILE__)).strip
  s.date                      = Date.today.to_s
  s.required_rubygems_version = ">= 1.3.6"
  s.rdoc_options              = ["--charset=UTF-8"]

  s.add_runtime_dependency 'multi_json', '~> 1.3.4'
  s.add_runtime_dependency 'rake', '~> 0.9.2.2'
end

