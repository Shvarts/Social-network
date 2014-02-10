require 'spec_helper'

describe User do

  before do
    @users = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")

  subject { @users }

  it { should respond_to(:authenticate) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }

  describe "remember token" do
    before { @users.save }

    its(:remember_token) { should_not be_blank }
   end
  end
end