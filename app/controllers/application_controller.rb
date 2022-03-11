require 'pry'

class ApplicationController < ActionController::API
    include ::ActionController::Cookies

    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t', "HS256")
    end
end
