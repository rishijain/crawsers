require 'nokogiri'
require 'open-uri'

module Parser
  def download_page_source_from url
    page = Nokogiri::HTML(open (url))
  end

  def find_links_to_crawse page_source, links=[]
    list = []
    page_source.css(html_tags_to_parse).each do |d|
      list << d.attributes['href'].value
    end
    list
  end
end
