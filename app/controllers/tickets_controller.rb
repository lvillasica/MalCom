  class TicketsController < ApplicationController
  
  before_filter :get_project
  before_filter :get_ticket, :only => [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :js
  
  def index
    @is_resolved = true if params[:status].eql? "Resolved"
    @tickets = @project.tickets.search(params[:date], params[:assigned_to], params[:status], params[:priority])
  end
  
  def new
    @ticket = Ticket.new
    @ticket.tags.build
  end
  
  def create
    @ticket = @project.tickets.new(params[:ticket])
    @ticket.tags.build(@ticket.separate_tags(@project.id, params[:tags][:label]))
    if @ticket.save
      redirect_to project_tickets_path(@project)
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @ticket.update_tags(params[:tags][:label], @ticket.tags)
    if @ticket.update_attributes(params[:ticket])
      redirect_to project_tickets_path(@project)
    else
      render :edit
    end
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
