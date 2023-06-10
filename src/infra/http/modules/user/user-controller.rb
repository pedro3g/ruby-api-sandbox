require_relative '../../../../app/usecases/create-user'
require_relative '../../../database/repositories/user-db-repository'

class UserController
  def initialize()
  end

  def create(request, response)
    body = JSON.parse(request.body)

    createUser = CreateUser.new(UserDbRepository.new())

    result = createUser.execute(body)

    response.content_type = 'application/json'

    if result.either(
      -> (error) { response.status = 400; response.body = { :message => error }.to_json },
      -> (data) { response.status = 201; response.body = { :message => 'User created' }.to_json }
    )
    end
  end
end