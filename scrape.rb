def generate_adjectives
  result = scrape_adjectives
  [result.sample, result.sample]
end

def suffix
  scrape_animals.sample
end



def scrape_adjectives
  html_file = open("http://www.gingersoftware.com/content/grammar-rules/adjectives/lists-of-adjectives/")
  html_doc = Nokogiri::HTML(html_file)
  result = []

  html_doc.search('.list li').each do |element|
    result << element.text
  end
  result
end

def scrape_animals
  html_file = open("http://a-z-animals.com/animals/")
  html_doc = Nokogiri::HTML(html_file)
  result = []

  html_doc.search('.article_az ul li a').each do |element|
    result << element.text
  end
  result
end
