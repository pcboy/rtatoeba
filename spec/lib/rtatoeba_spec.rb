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

require 'spec_helper'

describe Rtatoeba do
  it "should return sample sentences" do
    tatoe = Rtatoeba::Rtatoeba.new(from: 'eng', to: 'kor', query: 'hello')
    expect(tatoe.sentences).not_to be_empty
    expect(tatoe.sentences.values.any?(&:empty?)).to eql(false)
    tatoe = Rtatoeba::Rtatoeba.new(from: 'eng', to: 'fra', query: 'monday')
    expect(tatoe.sentences).not_to be_empty
    expect(tatoe.sentences.values.any?(&:empty?)).to eql(false)
  end

  it "should gives an error if lang is incorrect" do
    expect{
      Rtatoeba::Rtatoeba.new(from: 'english', to: 'fra', query: 'hello')
    }.to raise_error(Rtatoeba::Rtatoeba::InvalidLangFormat)
    expect{
      Rtatoeba::Rtatoeba.new(from: 'en', to: 'french', query: 'hello')
    }.to raise_error(Rtatoeba::Rtatoeba::InvalidLangFormat)
  end
end
