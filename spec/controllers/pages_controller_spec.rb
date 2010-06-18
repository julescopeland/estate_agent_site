require 'spec_helper'

describe PagesController do
  integrate_views
  
  before(:each) do
    @default_title = "Estate Agents | "
  end
  
  it "should use PagesController" do
    controller.should be_an_instance_of(PagesController)
  end


  describe "GET 'home'" do
    it "should load" do
      get 'home'
      response.should be_success
    end
    it "should have the right title" do
      get 'home'
      response.should have_tag("title", 
                                @default_title + "Home")
    end
  end

  describe "GET 'contact'" do
    it "should load" do
      get 'contact'
      response.should be_success
    end
    it "should have the right title" do
      get 'contact'
      response.should have_tag("title", 
                                @default_title + "Contact")
    end
  end
  
  describe "GET 'about'" do
    it "should load" do
      get 'about'
      response.should be_success
    end
    it "should have the right title" do
      get 'about'
      response.should have_tag("title", 
                                @default_title + "About")
    end
  end
  
  describe "GET 'help'" do
    it "should load" do
      get 'help'
      response.should be_success
    end
    it "should have the right title" do
      get 'help'
      response.should have_tag("title", 
                                @default_title + "Help")
    end
  end
end
