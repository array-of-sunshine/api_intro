require 'unirest'
# make a useful weather app
# inputs
  # city state
  # hardcode Chicago
# output
  # a printed sentence
  # "Today in Chicago it is 80 degrees and clear"

p "Enter your city"
user_city = gets.chomp
p "Enter your state"
user_state = gets.chomp
# weather.rb:14:in `<main>': undefined local variable or method `city' for main:Object (NameError)
response = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{user_city}%2C%20#{user_state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

city = response.body['query']['results']['channel']['location']['city']
region = response.body['query']['results']['channel']['location']['region']
temp = response.body['query']['results']['channel']['item']['condition']['temp']
condition = response.body['query']['results']['channel']['item']['condition']['text']
# puts JSON.pretty_generate(response.body['query']['results']['channel']['item']['condition'])

p "Today in #{city} #{region} it is #{temp} and #{condition}"
