require 'spec_helper'

describe Project do
  before(:each) do
    @project = Project.new(:project_name => 'Project', :description => 'This is a project.', :status => 'Active')
  end
  
  it "should not be saved if project name is empty" do
    @project.project_name = ""
    @project.should_not be_valid
  end
  
  it "should not be saved if project description is empty" do
    @project.description = ""
    @project.should_not be_valid
  end
  
  it "should not be saved if status is not active or close" do
    @project.status = 'Something Else'
    @project.should_not be_valid
  end
  
  it "should not be saved if project name and description are empty" do
    @project.project_name = ""
    @project.description = ""
    @project.should_not be_valid
  end
  
end
