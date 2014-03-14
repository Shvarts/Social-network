module ProfileHelper
# Return the user's profile URL.
  def profile_for(user)
    users_path(:id=> user.id)
  end
end