module WelcomeHelper
  def scrape()
    links = []
    source = open("https://twitter.com/shittyjokes?lang=en")
    page = Nokogiri::HTML(source)
    page.css('div.js-tweet-text-container > p').each do |link|
        links << { content: link.content}
    end
    return links[rand(links.size)][:content]
  end
end
