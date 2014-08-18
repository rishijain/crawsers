require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative 'parser'
require_relative 'math_standard'
require_relative 'english_standard'

class EducadeCrawser
  include Parser

  def find_and_save_links_to_be_parsed
    links = get_math_standards
    links << get_english_standards
    write_to_csv_file links.flatten!
  end

  private

  def write_to_csv_file links
    CSV.open(file_path_for_links_csv, 'a+') do |csv|
      links.each {|link| csv << [link]}
    end
  end

  def get_math_standards
    MathStandard.new.return_links_for_standards
  end

  def get_english_standards
    EnglishStandard.new.return_links_for_standards
  end
  
  def file_path_for_links_csv
    "links_to_parse.csv"
  end

end

EducadeCrawser.new.find_and_save_links_to_be_parsed







=begin

  def math_url
    #"http://www.corestandards.org/Math/"
    #"http://www.corestandards.org/Math/Content/K/CC/"
    #"http://www.corestandards.org/ELA-Literacy/CCRA/R/"
    #"http://www.corestandards.org/Math/"
    "http://www.corestandards.org/ELA-Literacy/"
  end

  def find_links_to_crawse page_source
    #s = page_source.css('div.standard')
    
    #s = page_source.css('div#ela-sidebar div.menu-ela-k-12-container ul li ul.sub-menu li a')
    #s = page_source.css('div#sidebar div#math-sidebar div.menu-Math-K-12-container ul#menu-Math-K-12 li ul.sub-menu li a')
    p '1-----'
    s.each do |d|
      
      p d.attributes['href'].value
      
      #p d.children.first.text
      #p d.children.last.text
    end
  end
  
  def self.run
    q = new
    q.find_links_to_crawse q.download_page(q.math_url)
  end



to get the name of standards of particular page
s = page_source.css('div.standard a')
  p '1-----'
  s.each do |d|
    p d.text
  end



to get both the standard name and description, use this:
    s = page_source.css('div.standard')
    p '1-----'
    s.each do |d|
      p d.children.first.text
      p d.children.last.text
    end
=end


#EducadeCrawser.run
