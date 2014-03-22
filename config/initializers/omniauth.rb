Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '445499648911688', '66642237f5c083c6fab62234f577fa50'
  provider :twitter, 'BpcYqtBhydHIVZJZQqnMow', 'D31kQVQAAxx2k4gZaSzBb8TWq90H2xEWo8O7I3kqI'
  provider :google_oauth2, '374690972605.apps.googleusercontent.com', 'FB8QbOUbPG3EHTeh3TOahfhv'
end