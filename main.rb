require 'sinatra'
require 'sinatra/reloader'


## url バラメータ

get '/hello/:name' do
  "hello #{params[:name]}"
end
get '/hello2/:fname/?:lname?' do |f, l| # 後ろに '?' をつけると optional になる
  "hello #{f} #{l}"
end

get '/from/*/to/*' do |f, t|
  "from #{f} to #{t}"
end

get %r{/users/([0-9]*)} do |user_id|
  "user id = #{user_id}"
end

## テンプレートエンジン
get '/' do
  @name = "world"
  erb :index
end

get '/:name' do |n|
  @name = n
  erb :index
end

