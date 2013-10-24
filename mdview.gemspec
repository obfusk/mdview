require File.expand_path('../lib/mdview/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mdview'
  s.homepage    = 'https://github.com/obfusk/mdview'
  s.summary     = 'markdown preview'

  s.description = <<-END.gsub(/^ {4}/, '')
    markdown preview

    mdview starts a web server that allows you to browse directories
    and view `.md` files.
  END

  s.version     = MDView::VERSION
  s.date        = MDView::DATE

  s.authors     = [ 'Felix C. Stegerman' ]
  s.email       = %w{ flx@obfusk.net }

  s.license     = 'GPLv2'

  s.executables = %w{ mdtopdf mdview }
  s.files       = %w{ .yardopts README.md Rakefile } \
                + %w{ mdview.gemspec } \
                + Dir['{lib,spec}/**/*.{css,haml,rb}']

  s.add_runtime_dependency 'haml'
  s.add_runtime_dependency 'pygments.rb'
  s.add_runtime_dependency 'redcarpet'
  s.add_runtime_dependency 'sinatra'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.required_ruby_version = '>= 1.9.1'
end
