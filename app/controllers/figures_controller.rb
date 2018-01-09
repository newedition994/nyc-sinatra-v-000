class FiguresController < ApplicationController

   get '/figures' do
     @figures = Figure.all
     erb :'/figures/index'
   end

   get '/figures/new' do
     erb :'/figures/new'
   end

   post '/figures' do
     @figure = Figure.create(name: params["figure"]["name"])

     @figure.title_ids = params["figure"]["title_ids"]
     if !params["title"]["name"].empty?
       @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
     end
     @figure.landmark_ids = params["figure"]["landmark_ids"]
     if !params["landmark"]["name"].empty?
       @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
     end
     @figure.save
     redirect "/figures/#{@figure.id}"
   end

   get '/figures/:id' do
     @figure = Figure.find_by_id(params[:id])
     erb :'/figures/show'
   end

   get '/figures/:id/edit' do
     @figure = Figure.find_by_id(params[:id])
     erb :'/figures/edit'
   end

   post '/figures/:id' do
     binding.pry
     @figure = Figure.find(params[:id])
     @figure.update(params[:figure])
     @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
     @figure.landmarks << Landmark.find_or_create_by(name: params["landmarks"]["name"])
     @figure.save
     redirect "/figures/#{@figure.id}"
   end

end
