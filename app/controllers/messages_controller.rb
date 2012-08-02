class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end

  def create
    @message = Message.new(params[:message])
    @user = User.find_by_email_and_admin("77svli@gmail.com",true)
    @user.messages << @message
    if @user.save
      respond_to do |format|
        format.html{redirect_to messages_path, notice: "Thanks for your advise"}
      end
    else
      render action: "index"
    end
  end

  def destroy
    authorize! :delete, Message
    @message = Message.find(params[:id])
    if @message.destroy
      redirect_to messages_url, notice: "Comment deleted"
    else
      redirect_to messages_url, alert: "Failed to delete the comment"
    end
  end

end
