class FilmsController < ApplicationController

    before_action :protected_action, except: :index

    def index
        films = Film.all 

        render json: films.to_json(:include => {
            :frames => {:only => [:frame_string, :order, :id]}
        })
    end 

    def create
        film = Film.create(film_params)
        film.update(user: @current_user)

        if film.valid?
            render json: film, include: [:frame]
        else 
            render json: { errors: film.errors.full_messages }, status: :not_acceptable
        end 
    end 

    def update
        
    end 

    def destroy
        film = Film.find(params[:id])
        film.destroy
        # render json: film
    end

    private    

    def film_params
        params.require(:film).permit(:title, :description, :user_id)
    end
end
