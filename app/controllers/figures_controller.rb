class FiguresController < ApplicationController

  get '/figures' do 
    @figure = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do 
    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.create(params[:figure])
    @title_name = params[:title][:name]
    @landmark_name = params[:landmark][:name]
    if @title_name != ""
      @title = Title.create(name: @title_name)
      @figure.titles << @title
    end

    if @landmark_name != ""
      @landmark = Landmark.create(name: @landmark_name)
      @figure.landmarks << @landmark
    end
    redirect '/figures'
  end

  get '/figures/:id' do 
    @figure = Figure.find_by(id: params["id"])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params["id"])
    @landmark = @figure.landmarks
    @title = @figure.titles
    erb :'/figures/edit'
  end

  post '/figures/:id' do
      @figure = Figure.find_by(id: params["figure"]["id"])
      @landmark = Landmark.find_by(id: params["figure"]["landmark_ids"])
      @landmark_name = Landmark.find_by(name: params["landmark"]["name"])
      @title = Title.find_by(id: params["figure"]["title_ids"])
      @title_name = Title.find_by(name: params["title"]["name"])
          if !@figure
            @figure = Figure.create(params["figure"])
          else
            @figure.update(params[:figure])
          end
          if !@landmark && !@landmark_name
            @landmark.update(params[:landmark])
          else
            @landmark = Landmark.create(params["landmark"])
            @figure.landmarks << @landmark
          end
          if !@title && !@title_name
            @title.update(params[:title])
          else
            @title = Title.create(params[:title])
            @figure.titles << @title
          end

      redirect "/figures/#{@figure.id}"
  end
end