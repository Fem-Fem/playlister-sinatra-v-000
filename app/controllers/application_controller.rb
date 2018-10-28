class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :newsong
    # binding.pry
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params["slug"])
    erb :song
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    if Artist.find_by(name: params["Artist Name"]) == nil
      @song.artist = Artist.create(name: params["Artist Name"])
    else
      @song.artist = Artist.find_by(name: params["Artist Name"])
    end
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
    # get params
    # check to see if artist exists
    # if no, create new artist
    # if yes, do not create new artist
    # redirect to '/songs/:slug'
  end


  get '/songs/:slug/edit' do
    erb :editsong
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params["slug"])
    erb :artist
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params["slug"])
    erb :genre
  end
end
