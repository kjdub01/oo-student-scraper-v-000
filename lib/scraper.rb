require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    site = Nokogiri::HTML(open(index_url))
    student_list = []
      site.css("student-card") do |student|
        student_info = {
          name: student.css(".student-name").text,
          location: student.css(".student-location").text,
          profile_url: student.css("a").attribute("href").value
        }
        student_list << student_info
      end
      student_list
  end

  def self.scrape_profile_page(profile_url)
    
  end

end