class FiguresController < ApplicationController
   get '/figures' do
     @figures = Figure.all
     erb :"figures/index"
   end

   get '/figures/new' do
     erb :"figures/new"
   end

   post '/figures' do
     @figure = Figure.create(params["figure"])
     if !params[:landmark][:name].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end

     if !params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])
     end

     @figure.save
     redirect to "/figures/#{@figure.id}"
   end

   get '/figures/:id/edit' do
     @figure = Figure.find_by_id(params[:id])
     erb :"figures/edit"
   end

   get '/figures/:id' do
     @figure = Figure.find_by_id(params[:id])
     erb :"figures/show"
   end

   post '/figures/:id' do
     @figure = Figure.find(params[:id])
 +    @figure.name = params["figure"]["name"]
 +    if !Title.find_by_id(params["figure"]["title_ids"])
 +      @figure.titles << Title.create(name: params["title"]["name"])
 +    else
 +      @figure.titles << Title.find_by_id(params["figure"]["title_ids"])
 +    end
 +    if !Landmark.find_by_id(params["figure"]["landmark_ids"])
 +      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
 +    else
 +      @figure.landmarks << Landmark.find_by_id(params["figure"]["landmark_ids"])
 +    end
 +    @figure.save
 +    redirect to "/figures/#{@figure.id}"
   end

end
