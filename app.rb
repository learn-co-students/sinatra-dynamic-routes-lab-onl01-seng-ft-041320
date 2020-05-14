require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @user_name = params[:name]
    "#{@user_name.reverse}"
  end

  get '/square/:number' do
    @new_num = params[:number].to_i * params[:number].to_i
    "#{@new_num}"
  end

  # FIXME: NOT WORKING
  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    params[:phrase] * @num
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @phrase = params[:word1] + " " + params[:word2] + " " + params[:word3] + " " + params[:word4] + " " + params[:word5]
    "#{@phrase}."
  end

  get '/:operation/:number1/:number2' do
    @op = params[:operation]
    case @op
    when "multiply"
      @result = params[:number1].to_i * params[:number2].to_i
    when "add"
      @result = params[:number1].to_i + params[:number2].to_i
    when "subtract"
      @result = params[:number1].to_i - params[:number2].to_i
    when "divide"
      @result = params[:number1].to_i / params[:number2].to_i
    else
      @result = "Params were entered wrong! Try again!"
    end

    "#{@result}"
  end
end
