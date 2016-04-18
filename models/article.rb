class Article
  attr_reader :description, :title, :url

  def initialize(title, url, description)
    @description = description
    @title       = title
    @url         = url
  end

  def lister
    File.open('articles.csv', 'a+') do |article|
      puts article[0]
    end
  end
end
