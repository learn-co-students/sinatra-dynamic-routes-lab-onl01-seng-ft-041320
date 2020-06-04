require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @reverse_name = params[:name].reverse
    "#{@reverse_name}"
  end

  get '/square/:number' do
    @squared_num = params[:number].to_i.pow(2)
    "#{@squared_num}"
  end

  get '/say/:number/:phrase' do
    @number_of_times = params[:number].to_i
    @phrase = params[:phrase]

    # binding.pry
    "#{@phrase}\n" * @number_of_times
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
    @operation = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i

    case @operation
    when "add"
      "#{@number1 + @number2}"
    when "multiply"
      "#{@number1 * @number2}"
    when "divide"
      "#{@number1 / @number2}"
    when "subtract"
      "#{@number1 - @number2}"
    else
      "Failed Input"
    end
  end
end