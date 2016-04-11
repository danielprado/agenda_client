require 'active_resource'
class User < ActiveResource::Base
  self.site= "http://localhost:3000/api/v1/"
  self.element_name="token_authentication"
  attr_accessor :email, :password
end
