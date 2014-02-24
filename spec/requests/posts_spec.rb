require "spec_helper"

describe "Posts" do
	it "CRUD" do
		@post = Post.new
        post = Post.create!(title:"test -1",content: "test content -1") 
        post = @post.update!(title:"test 2",content: "test content -2")
        post = @post.destroy!
	end
end

describe "Posts modal window", :js => true do
	  
	it "new" do
        visit '/'
	    click_on 'bt_post_new'
		within("#new_post") do
      		fill_in 'post_title', :with => 'user@example.com'
      		fill_in 'post_content', :with => 'caplin'
      		click_button 'Create Post'
    	end
    	expect(page).to have_content 'footer'
	end

	it "update" do
	    visit '/'
		first('button.up').click 
		within("div#render_post_mw") do
	    	fill_in 'post_title', with: "update 1"
	    	fill_in 'post_content', with: "update_content 1"
	    	click_on 'Update Post'
	    end
	    expect(page).to have_content 'footer'
	end

	it "delete" do
	    visit '/'
		first('button.de').click 
		expect(page).to have_content 'footer'
	end

end
