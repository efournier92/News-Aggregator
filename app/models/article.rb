require "net/http"

class Article

  attr_reader :title, :url, :description, :errors

  def initialize(info_hash = nil)
    unless info_hash.nil?
      @title       = info_hash["title"]
      @url         = info_hash["url"]
      @description = info_hash["description"]
      @errors      = []
    end
  end

  def self.all
    articles = []
    db_connection do |connection|
      connection.exec("SELECT * FROM articles").each do |article|
        articles << Article.new({
          "title"       => article["title"],
          "url"         => article["url"],
          "description" => article["description"]
          })
        end
      articles
    end
  end

  def errors
    @errors ||= []
  end

  def valid?
    if @title.empty? || @url.empty? || @description.empty?
      @errors << "Please completely fill out form"
    end

    if !url.empty?
      unless @url.include?("http")
        @errors << "Invalid URL"
      end

      if Article.all.any? { |article| article.url == url }
        errors << "Article with same url already submitted"
      end
    end

    if !description.empty? && description.length < 20
      errors << "Description must be at least 20 characters long"
    end

    errors.empty?
  end

  def save
    if valid?
      db_connection do |connection|
        connection.exec"INSERT INTO articles (title, url, description) VALUES('#{@title}','#{@url}','#{@description}')"
      end
      true
    else
      false
    end
  end
end
