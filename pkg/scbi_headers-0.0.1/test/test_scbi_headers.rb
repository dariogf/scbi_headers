# encoding: utf-8

require File.dirname(__FILE__) + '/test_helper.rb'

class TestScbiHeaders < Test::Unit::TestCase

  def setup
    @header = ScbiHeader.new('SAMPLE_PROGRAM','101')
    @header.description="A long description for this program. It may include a few lines of text. In such cases, a word based wrap will be applied."
    
    @header.copyright='2012'
    
    @header.authors<< "Darío Guerrero"
    @header.authors<< "Other"
    
    @header.articles<< "Article one: with one description line"
    @header.articles<< "Article two: with one description line"
    
    puts @header
  end
  
  def test_truth

    assert true
  end
end
