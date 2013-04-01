# -*- encoding : utf-8 -*-
#
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                  Version 2, December 2004
#
#  Copyright (C) 2004 Sam Hocevar
#  14 rue de Plaisance, 75014 Paris, France
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#
#
#  David Hagege <david.hagege@gmail.com>
#

#require "rtatoeba/version"
require 'mechanize'

module Rtatoeba
  class Rtatoeba
    def initialize(params={})
      @from = params[:from] || "eng"
      @to = params[:to] || "eng"
      @query = params[:query]

      @agent = Mechanize.new
    end

    def sentences
      content =
        @agent.get("http://tatoeba.org/eng/sentences/search?query=#{@query}&from=#{@from}&to=#{@to}")
      sentences = []
      sentences = content.links_with(:href => /eng\/sentences\/show/,
                                     :dom_class => /text/).map do |s|
        s.text
      end.each_slice(2).to_a
      sentences
    end
  end
end
