class FiguresController < ApplicationController

  get '/' do
    redirect to '/figures'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if params[:title][:name].length > 0
      @new_title = Title.create(params[:title])
      @figure.titles << @new_title
    end

    if params[:landmark][:name].length > 0
      @new_landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @new_landmark
    end
    redirect to '/figures'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if params[:title][:name].length > 0
      @new_title = Title.create(params[:title])
      @figure.titles << @new_title
    end

    if params[:landmark][:name].length > 0
      @new_landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @new_landmark
    end
    redirect "/figures/#{params[:id]}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end
end
