class EnglishStandard
  include Parser 
  
  def return_links_for_standards
    find_links_to_crawse download_page_source_from(page_to_be_parse)
  end

  private

  def page_to_be_parse
    "http://www.corestandards.org/ELA-Literacy/"
  end

  def html_tags_to_parse
    "div#ela-sidebar div.menu-ela-k-12-container ul li ul.sub-menu li a"
  end

end
