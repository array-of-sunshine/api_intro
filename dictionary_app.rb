require 'unirest'

while true
  system "clear"
  p 'enter your favorite word. enter \'q\' to quit'
  input_word = gets.chomp

  if input_word == "q"
    break
  end

  response_definitions = Unirest.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  # p response_definitions.body[0]['text']
  definitions = response_definitions.body

  p "here are the definitions"
  definitions.each do |definition|
    p definition['text']
  end
  p ""

  response_top_example = Unirest.get("https://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  p "here is the top example"
  p response_top_example.body['text']
  p ""


  response_prounciations = Unirest.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  # p response_prounciations.body[0]['raw']
  pronunciations = response_prounciations.body

  p "here are the pronunciations"
  pronunciations.each do |pronunciation|
    p pronunciation['raw']
  end
  p ""
end
