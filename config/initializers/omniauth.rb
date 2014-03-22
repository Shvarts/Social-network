Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '445499648911688', '66642237f5c083c6fab62234f577fa50'
end