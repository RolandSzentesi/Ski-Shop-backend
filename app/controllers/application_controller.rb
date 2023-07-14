class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  get '/trainers' do 
    trainers = Trainer.all
    trainers.to_json
  end

  get '/trainers/:id' do
    trainer = Trainer.find(params[:id])
    trainer.to_json(include: :lessons)
  end

  get '/trainers/:trainer_id/lessons' do
    trainer = Trainer.find(params[:trainer_id])
    trainer.lessons.to_json(include: :trainer)
  end

  patch '/trainers/:id' do
    trainer = Trainer.find(params[:id])
    trainer.update(
      name: params[:name],
      trainer_img: params[:trainer_img],
      location: params[:location]
    )
    trainer.to_json(include: :lessons)
  end

  post '/trainers' do
    trainer = Trainer.create(params)
    trainer.to_json(include: :lessons)
  end

  delete '/trainers/:id' do
    trainer = Trainer.find(params[:id])
    trainer.destroy
    trainer.to_json
  end
  
  get '/lessons' do 
    lessons = Lesson.all.order(:price)
    lessons.to_json
  end
  
  get '/lessons/:id' do
    lesson = Lesson.find(params[:id])
    lesson.to_json
  end
  
  post '/trainers/:trainer_id/lessons' do
    trainer = Trainer.find(params[:trainer_id])
    lesson = trainer.lessons.create(params)
    lesson.to_json
  end

  patch '/lessons/:id' do
    lesson = Lesson.find(params[:id])
    lesson.update(
      date: params[:date],
      price: params[:price],
      description: params[:description],
    )
    lesson.to_json(include: :skis)
  end

  delete '/lessons/:id' do
    lesson = Lesson.find(params[:id])
    lesson.destroy
    lesson.to_json
  end


end