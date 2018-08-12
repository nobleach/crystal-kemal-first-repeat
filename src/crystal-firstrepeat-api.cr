require "./crystal-firstrepeat-api/*"
require "kemal"

# TODO: Write documentation for `Crystal::Firstrepeat::Api`
module Crystal::Firstrepeat::Api
  get "/" do
      "Hello world!"
  end

  get "/health" do
      {healthCheck: "OK", message: "The mouse is out of the house"}.to_json
  end

  get "/first/:str" do |env|
      str = env.params.url["str"]

      # Create a set to store seen chars in 
      seen = Set(Char).new

      # Creat storage for first find
      first_find : String
      first_find = ""

      # Walk the String Char by Char
      str.each_char do |char|
        if seen.includes? char
          # Convert Char to String and set store it
          first_find = char.to_s
          break
        else
          # Otherwise, push it into the Set of seen Chars
          seen << char unless char == ' '
        end
      end
      {originalString: str, firstRepeat: first_find }.to_json
  end

  Kemal.run

  # TODO: Put your code here
end
