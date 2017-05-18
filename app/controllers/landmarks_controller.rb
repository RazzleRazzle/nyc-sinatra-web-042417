class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    @new_landmark = Landmark.create(params[:landmark])
    redirect to '/landmarks'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    # if params[:title][:name].length > 0
    #   @new_title = Title.create(params[:title])
    #   @figure.titles << @new_title
    # end
    #
    # if params[:landmark][:name].length > 0
    #   @new_landmark = Landmark.create(params[:landmark])
    #   @figure.landmarks << @new_landmark
    # end
    redirect "/landmarks/#{params[:id]}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    #@landmarks = Landmark.all
    erb :'landmarks/edit'
  end

end
