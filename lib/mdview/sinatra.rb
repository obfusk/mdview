# --                                                            ; {{{1
#
# File        : mdview/sinatra.rb
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-10-25
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2
#
# --                                                            ; }}}1

require 'pathname'

require 'haml'
require 'sinatra/base'

require 'mdview'

class MDView::Sinatra < Sinatra::Base

  set :app_file, __FILE__

  def link_to(f)
    File.directory?(f) ? "/dir=#{f}" : "/file=#{f}"
  end

  def subpath_of_pwd?(f)
    c = Pathname.pwd.realpath.to_s
    x = Pathname.new(f).realpath.to_s
    "#{x}/".start_with? "#{c}/"
  end

  get '/' do
    redirect "/dir=#{Dir.pwd}"
  end

  get '/dir=*' do |dir|
    return 403 unless subpath_of_pwd? dir
    @title  = dir
    @up     = File.dirname dir
    @files  = Dir["#{dir}/*"].select do |x|
      File.directory?(x) || x.end_with?('.md')
    end .sort
    haml :dir
  end

  get '/file=*.md' do |file|
    f       = "#{file}.md"
    return 403 unless subpath_of_pwd? f
    @title  = f
    @html   = MDView.md File.read f
    haml :md
  end

  get '/css/pygments.css' do
    content_type 'text/css'
    MDView.css
  end

  error 403 do
    'Access forbidden'
  end

end

# vim: set tw=70 sw=2 sts=2 et fdm=marker :
