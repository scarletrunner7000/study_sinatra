require 'sinatra'
require 'sinatra/reloader'

before do
  @author = "hoge@gmail.com"
end

before '/admin/*' do
  @msg = "admin area!!"
end

after do
  logger.info "page displayed successfully"
end


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
  @title = "main index"
  @content = "main content by " + @author
  erb :index
end

get '/about' do
  @title = "about this page"
  @content = "this page is ..."
  @email = "hoge@gmail.com"
  erb :about
end

