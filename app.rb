require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    "#{@phrase * @number}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]

    @words = [@word1, @word2, @word3, @word4, @word5]

    "#{@words.join(" ")}."
  end

  get '/:operation/:number1/:number2' do
    @operation, @number1, @number2 = params[:operation], params[:number1], params[:number2]
    @operations = {
      add: "+",
      subtract: "-",
      multiply: "*",
      divide: "/",
      exponent: "**"
    }
    
    if @operations.include?(@operation.to_sym)
      @operator = @operations.find do |k, v| 
                   k == @operation.to_sym
                 end[1]
      @operation_value = @number1.to_i.send(@operator, @number2.to_i)
      "#{@operation_value.to_s}"
    end
  end

  get '/square/:number' do
    @number = params[:number]
    "#{@number.to_i ** 2}"
  end
end