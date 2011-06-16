class CommentsController < ApplicationController
  before_filter :get_ticket
  before_filter :authenticate_user!, :except => [:index, :show, :new, :create]

  def index
    @comments = @ticket.comments
  end
  
  def show
  end

  def new 
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(params[:comment])
    @comment.ticket_id = params[:ticket_id]
    @comment.save
    redirect_to ticket_comments_path(@comment.ticket_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to ticket_comments_path(@comment.ticket_id)
  end

private
  def get_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

end
