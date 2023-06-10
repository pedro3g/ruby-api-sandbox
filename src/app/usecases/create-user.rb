require_relative '../../domain/entities/user'
require_relative '../repositories/user-repository'
require_relative '../../domain/errors/either'

class CreateUser
  attr_reader :repository

  def initialize(repository)
    @repository = repository
  end

  def execute(data)
    userExists = repository.find_by_email(data['email'])

    if userExists.length > 0
      return Either.left('User already exists')
    end

    user = User.new({
      :name => data['name'],
      :email => data['email'],
      :password => data['password']
    })

    newUser = repository.save(user)

    return Either.right(newUser)
  end
end