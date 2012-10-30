Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '0990817e7e15ba767352',
    'aab2314c86944fe2ab1fe6710ab0b8cdb56380f7'
end
