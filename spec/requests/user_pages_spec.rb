require 'spec_helper'

describe "UserPages" do
	
  describe "GET /user_pages" do
	  
    describe "with valid information" do
	  
      describe "after saving the user" do
      before { click_button submit }
      let(:users) { Users.find_by(email: 'user@example.com') }

      end

    end

  end

end
