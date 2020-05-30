require_relative 'config/environment'

class App < Sinatra::Base
  
  get "/reversename/:name" do
    a = params[:name]
    a.reverse!
    a
  end 

  
  get "/square/:number" do
    square = params[:number].to_i * params[:number].to_i
    square.to_s
  end
  

#  accepts a number and a phrase and returns that phrase in a single string the number of times given.
  get "/say/:number/:phrase" do
    number = params[:number].to_i
		phrase = params[:phrase]
		string = ""
		number.times do
			string += phrase
		end
		string
	end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    string = params[:word1] + " " + params[:word2] + " " + params[:word3] + " " + params[:word4] + " " + params[:word5] + "."
    string
  end
  
  get "/:operation/:number1/:number2" do
    if params[:operation] == "add"
        result = params[:number1].to_i + params[:number2].to_i
        result.to_s
      elsif params[:operation] == "subtract"
        result = params[:number1].to_i - params[:number2].to_i
        result.to_s
      elsif params[:operation] == "divide"
        result = params[:number1].to_i / params[:number2].to_i
        result.to_s
      elsif params[:operation] == "multiply"
        result = params[:number1].to_i * params[:number2].to_i
        result.to_s
    end
  end
  

end