require 'spec_helper'

describe "UserPages" do
	
  describe "GET /user_pages" do
	  
    describe "with valid information" do
	  
      describe "after saving the user" do
      before { click_button submit }
      let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end
