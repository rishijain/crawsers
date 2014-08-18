class MathStandard
  include Parser

  def return_links_for_standards
    find_links_to_crawse download_page_source_from(page_to_be_parse)
  end
 
  private

  def html_tags_to_parse
    "div#sidebar div#math-sidebar div.menu-Math-K-12-container ul#menu-Math-K-12 li ul.sub-menu li a"
  end
  
  def page_to_be_parse
    "http://www.corestandards.org/Math/"
  end
end
