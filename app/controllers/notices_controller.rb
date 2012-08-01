class NoticesController < ApplicationController
  load_and_authorize_resource #cancan use to authorize

  def index
    authorize! :edit, Notice
    @notices = current_user.notices.order("created_at DESC")
  end

  def destroy
    @notice = Notice.find(params[:id])
    if @notice.destroy
      redirect_to notices_url, notice: "Notice deleted"
    else
      redirect_to notices_url, notice: "Faile to delete notice"
    end
  end
end
