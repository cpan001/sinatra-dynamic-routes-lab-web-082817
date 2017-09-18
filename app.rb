require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    @name = params[:name].reverse
    "#{@name}"
  end

  get "/square/:number" do
    @number = params[:number].to_i
    "#{@number*@number}"
  end

  get "/say/:number/:phrase" do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    code =
    "<% #{@number}.times do %>
    <%='#{@phrase}'%>
    <% end %>"
    erb code
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @sentence = params.values.join(" ")
    "#{@sentence}."
  end

  get "/:operation/:number1/:number2" do
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    "#{operation_helper(@operation, @num1, @num2)}"
  end

  def operation_helper(term, num1, num2)
    case term
    when "add"
      num1 + num2
    when "subtract"
      num1 - num2
    when "multiply"
      num1 * num2
    when "divide"
      num1 / num2
    end
  end

end
