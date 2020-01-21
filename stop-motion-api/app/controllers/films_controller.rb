class FilmsController < ApplicationController

    before_action :protected_action

    def create
        film = Film.create(film_params)
        film.update(user: @current_user)

        if film.valid?
            render json: film 
        else 
            render json: { errors: film.errors.full_messages }, status: :not_acceptable
        end 
    end 

    def update
        
    end 

    def destroy
        film = Film.find_by(params[:id])

        render json: film
        film.delete
    end

    private    

    def film_params
        params.require(:film).permit(:title, :description, :user_id)
    end
end
