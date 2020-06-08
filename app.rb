require_relative 'config/environment'

class App < Sinatra::Base

get '/reversename/:name' do
@user_name = params[:name]
@user_name.reverse
end

get '/square/:number' do 
	@square = "#{params[:number].to_i * params[:number].to_i}"
	@square
end 
 
   get '/say/:number/:phrase' do
      @number = params[:number]
      @phrase = params[:phrase]
      @phrase * @number.to_i   
    end
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    
      @word1 = params[:word1]
      @word2 = params[:word2]
      @word3 = params[:word3]
      @word4 = params[:word4]
      @word5 = params[:word5]
      "#{@word1} #{@word2} #{@word3} #{@word4} #{@word5}."
    end
    
    get '/:operation/:number1/:number2' do 
    @number_1 = params[:number1].to_i
    @number_2 = params[:number2].to_i
    if params[:operation] == "add"
      "#{@number_1+@number_2}"
    elsif params[:operation] == "subtract"
      "#{@number_1-@number_2}"
    elsif params[:operation] == "multiply"
      "#{@number_1*@number_2}"
    elsif params[:operation] == "divide"
      "#{@number_1/@number_2}"
    end
  end
end

