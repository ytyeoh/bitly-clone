require 'byebug'

get '/' do
  @desc ="Site to create short url."
  erb :"static/index"
end

post '/urls' do
  url = Url.new(long_url: params[:long_url])
  url.shorten
  # byebug
  if url.save
    redirect to('/done')
  else
    @errors = url.errors.full_messages
    # byebug
    erb :"static/errors"
  end
end

get '/done' do
  @url = Url.last
  @desc ="short url success generate"
  erb :"static/done"
end


get '/:short_url' do
  # byebug

  x = Url.find_by(short_url: params[:short_url])
  # x.click_count += 1
  # x.save
# byebug
  redirect to(x.long_url)
end

get '/done' do
  @url = Url.last
  @desc ="short url success generate"
  erb :"static/done"
end


