require 'unirest'

response = Unirest.get("https://api.wordnik.com/v4/word.json/set/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

# p response.body[0]['text']
definitions = response.body

definitions.each do |definition|
  # p definition['text']
end

response = Unirest.get("https://api.wordnik.com/v4/word.json/set/topExample?useCanonical=false&api_key=")

p response.body['text']

