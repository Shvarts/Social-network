require 'spec_helper'

describe "Authentication" do
  describe "signin" do

    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error') }
	  
        describe "followed by signout" do
          before { click_link "Sign out" }
          it { should have_link('Sign in') }
       end      
      end
    end
  end
