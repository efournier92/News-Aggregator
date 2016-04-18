require "sinatra"
require "csv"
require "pry"
require_relative "models/article"

get "/" do
  redirect "/articles"
end

get "/articles/new" do
  erb :new
end

post "/articles" do

  title = params["title"]
  url = params["url"]
  description = params["description"]

  new_article = "#{title}, #{url}, #{description}"

  File.open('articles.csv', 'a') do |csv|
    csv.puts(new_article)
  end

  redirect "/articles"
end

get "/articles" do
  @articles = []
  CSV.foreach("articles.csv") do |row|
    csv_a     = row.to_a
    @articles << Article.new(csv_a[0], csv_a[1], csv_a[2])
  end

  erb :home
end
