class TicketsController < ApplicationController
  
  before_filter :get_project
  before_filter :get_ticket, :only => [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @tickets = Ticket.all
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = @project.tickets.new(params[:ticket])
    @ticket.save
    redirect_to @project
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @ticket.update_attributes(params[:ticket])
    redirect_to @project
  end
  
  def destroy
    @ticket.destroy
    redirect_to project_tickets_url
  end
  
  private 
  
  def get_project
    @project = Project.find(params[:project_id])
  end
  
  def get_ticket
    @ticket = Ticket.find(params[:id]) 
  end
  
end
