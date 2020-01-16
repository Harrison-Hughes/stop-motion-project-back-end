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

    private

    def protected_action
        if !logged_in?
            render json: { errors: "you must be logged in" }, status: :unauthorized
        end
    end 

    def film_params
        params.require(:film).permit(:title, :description)
    end
end
