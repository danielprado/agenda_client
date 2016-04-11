require 'active_resource'
class Contact < ActiveResource::Base
  self.site= "http://localhost:3000/api/v1/users/:user_id/"
end
