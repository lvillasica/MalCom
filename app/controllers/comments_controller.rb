class CommentsController < ApplicationController
  before_filter :get_ticket
  before_filter :get_user
  before_filter :authenticate_user!, :except => [:index, :show, :new, :create]

  def index
    @comments = @ticket.comments
  end
  
  def show

  end

  def new 
  
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

private
  def get_article
    @ticket = Ticket.find(params[:id])
  end

end
