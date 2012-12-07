require "sinatra"
require "sinatra/reloader"
require 'debugger'

set :public_folder, File.dirname(__FILE__) + '/public'


get '/' do
	erb :index
end

post '/login' do
	@email = params[:email]
	@password = params[:password]

	redirect "/list"
end

get '/list' do
	@items= []
	File.open("list.txt", "r").each do |item|
		@items << item 
	end
	erb :task 
end

post '/add' do
	puts params
	@item = params[:listItem]  
	File.open("list.txt", 'a+') do |file|
		file.puts @item
	end
	redirect "/list"
end

# def create
    #@user = User.new(params[:user])
    #@user.password = params[:password]
   # @user.save!
 # end


 # def login
  #  @user = User.find_by_email(params[:email])
   # if @user.password == params[:password]
    #  give_token
   # else
     # redirect_to home_url
    #end
  #end
