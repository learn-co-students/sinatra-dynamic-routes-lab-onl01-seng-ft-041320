require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/reversename/:name' do
    @reversed_name = params[:name].reverse 
    "#{@reversed_name}"
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
    "#{@word1} #{@word2} #{@word3} #{@word4} #{@word5}."
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
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i

    answer = 'Unable to perform this operation'

    case params[:operation]
    when 'add'
      answer = (number1 + number2).to_s
    when 'subtract'
      answer = (number1 - number2).to_s
    when 'multiply'
      answer = (number1 * number2).to_s
    when 'divide'
      answer = (number1 / number2).to_s
    when 'exponent'
      answer = (number1 ** number2).to_s
    else
      answer
    end
  end
end

  get '/square/:number' do
    @squared_number = params[:number].to_i * params[:number].to_i
    "#{@squared_number}"
  end


end