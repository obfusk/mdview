# --                                                            ; {{{1
#
# File        : mdview.rb
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-10-24
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2
#
# --                                                            ; }}}1

require 'pygments'
require 'redcarpet'

module MDView

  # redcarpet + pygments
  class RedPyg < Redcarpet::Render::HTML
    def block_code(code, lang)
      Pygments.highlight code, lexer: MDView.lang(lang)
    end
  end

  # language aliases
  ALIASES = {
    'coffee' => 'coffeescript',
  }

  # renderer
  MD = Redcarpet::Markdown.new(
    RedPyg, no_intra_emphasis: true, fenced_code_blocks: true,
    autolink: true, lax_spacing: true
  )

  # pygments css
  def self.css
    Pygments.css '.highlight', style: 'autumn'
  end

  # language w/ aliases
  def self.lang(lang)
    ALIASES.fetch(lang,lang) || 'text'
  end

  # render markdown
  def self.md(s)
    MD.render s
  end

end

# vim: set tw=70 sw=2 sts=2 et fdm=marker :
