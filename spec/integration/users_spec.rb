require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
      
      it "should not make a new user" do
        lambda do
          visit signup_path
          click_button
          response.should render_template('users/new')
          response.should have_tag("div#errorExplanation")
        end.should_not change(User, :count)
      end
    end
    
    describe "success" do
      
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in :name,                  :with => "Jules Copeland"
          fill_in :email,                 :with => "jules@JulesCopeland.com"
          fill_in :password,              :with => "secret"
          fill_in :password_confirmation, :with => "secret"
          click_button
        end.should change(User, :count).by(1)
      end
      
    end
  end
end
