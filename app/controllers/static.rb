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
    return "
    <tr>
    <td>Long Url  :</td>
    <td><a href = '#{url.long_url}'>#{url.long_url}</a></td>    
    
  </tr>
  <tr>
    
    <td>Short Url  :</td>    
    <td><a href ='http://localhost:9393/#{url.short_url}'>localhost:9393/#{url.short_url}</a></td>
  </tr>"
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


