class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!!!!!!!!!!!" }.to_json
  end

  get '/events' do
    events = Event.all
    events.to_json
  end

  get '/events/:id' do
    event = Event.find(params[:id])
    event.to_json(include: :reviews)
  end

  get '/reviews' do
    reviews = Review.all
    reviews.to_json(include: :event)
  end

  get '/reviews/:id' do
    review = Review.find(params[:id])
    review.to_json
  end

  post '/reviews' do
    review = Review.create(comment: params[:comment], rating: params[:rating])
    review.to_json
  end

  delete '/reviews/:id' do 
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end

end
