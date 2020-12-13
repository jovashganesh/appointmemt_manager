class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment

  def new
    @comment = Comment.new
  end

  def create
    @comment = @appointment.comments.create(params[:comment].permit(:reply, :appointment_id))
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to appointment_path(@appointment)}
      else
        format.html { redirect_to appointment_path(@appointment), notice: "Your comment has not been saved"}
      end
    end
  end


  def destroy
    @comment = @appointment.comments.find(params[:id])
    @comment.destroy
    redirect_to appointment_path(@appointment)
  end


  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
