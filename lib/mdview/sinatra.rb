# --                                                            ; {{{1
#
# File        : mdview/sinatra.rb
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-10-24
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2
#
# --                                                            ; }}}1

require 'haml'
require 'sinatra/base'

require 'mdview'

class MDView::Sinatra < Sinatra::Base

  set :app_file, __FILE__

  def link_to(f)
    File.directory?(f) ? "/dir=#{f}" : "/file=#{f}"
  end

  get '/' do
    redirect "/dir=#{Dir.pwd}"
  end

  get '/dir=*' do |dir|
    @title  = dir
    @up     = File.dirname dir
    @files  = Dir["#{dir}/*"].select do |x|
      File.directory?(x) || x.end_with?('.md')
    end
    haml :dir
  end

  get '/file=*.md' do |file|
    @title  = file
    @html   = MDView.md File.read "#{file}.md"
    haml :md
  end

  get '/css/pygments.css' do
    content_type 'text/css'
    MDView.css
  end

end

# vim: set tw=70 sw=2 sts=2 et fdm=marker :
