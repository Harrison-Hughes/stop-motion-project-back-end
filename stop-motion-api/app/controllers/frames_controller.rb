class FramesController < ApplicationController

    before_action :protected_action

    def create
        frame = Frame.create(frame)
        frame.update(user: @current_user)

        if frame.valid?
            render json: frame 
        else 
            render json: { errors: frame.errors.full_messages }, status: :not_acceptable
        end 
    end 
    
    def update
    end

    def destroy
    end 
    
    private

    def frame
        params.require(:frame).permit(:frame_string, :order, :film_id)
    end

end
