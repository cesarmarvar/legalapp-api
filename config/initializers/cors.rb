Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://legalapp-0822.herokuapp.com/', 'http://localhost:3000', 'https://legalapp-api-production-0424.up.railway.app/'
    resource '*', headers: :any, methods: %i[get post put patch delete options head]
  end
end