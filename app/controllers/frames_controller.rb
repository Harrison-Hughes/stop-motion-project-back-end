class FramesController < ApplicationController

    before_action :protected_action

    def create
        frame = Frame.create(frame_params)
        # frame.update(user: @current_user)

        if frame.valid?
            render json: frame
        else 
            render json: { errors: frame.errors.full_messages }, status: :not_acceptable
        end 
    end 
    
    def update
    end

    def destroy
        frame = Frame.find(params[:id])
        frame.destroy
        # render json: frame
    end 
    
    private

    def frame_params
        params.require(:frame).permit(:film_id, :frame_string, :order)
    end

end
