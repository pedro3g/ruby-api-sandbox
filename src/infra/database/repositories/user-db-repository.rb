require 'sqlite3'
require_relative '../../../app/repositories/user-repository'

class UserDbRepository < UserRepository
  attr_accessor :db

  def initialize
    @db = SQLite3::Database.open('src/infra/database/data.db')
  end

  def find_by_email(email)
    user = db.execute <<~SQL
      SELECT * FROM users WHERE email = '#{email}';
    SQL

    return user
  end

  def save(user)
    newUser = db.execute <<~SQL
      INSERT INTO users (name, email, password) VALUES ('#{user.name}', '#{user.email}', '#{user.password}');
    SQL

    return newUser
  end
end