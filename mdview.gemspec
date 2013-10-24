require File.expand_path('../lib/mdview/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mdview'
  s.homepage    = 'https://github.com/obfusk/mdview'
  s.summary     = 'markdown preview + pdf '

  s.description = <<-END.gsub(/^ {4}/, '')
    markdown preview + pdf

    ...
  END

  s.version     = MDView::VERSION
  s.date        = MDView::DATE

  s.authors     = [ 'Felix C. Stegerman' ]
  s.email       = %w{ flx@obfusk.net }

  s.license     = 'GPLv2'

  s.executables = %w{ mdtopdf mdview }
  s.files       = %w{ .yardopts README.md Rakefile } \
                + %w{ mdview.gemspec } \
                + Dir['{lib,spec}/**/*.rb']

  s.add_runtime_dependency 'haml'
  s.add_runtime_dependency 'pygments.rb'
  s.add_runtime_dependency 'redcarpet'
  s.add_runtime_dependency 'sinatra'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.required_ruby_version = '>= 1.9.1'
end
