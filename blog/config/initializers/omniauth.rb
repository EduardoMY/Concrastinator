OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1526663814292247', '6c8ca184195c413bec026789db001a7c', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end