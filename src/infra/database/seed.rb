require 'sqlite3'

# puts "Creating user database..."

db = SQLite3::Database.open('src/infra/database/data.db')

# db.execute <<~SQL
#   CREATE TABLE IF NOT EXISTS users (
#     id INTEGER PRIMARY KEY AUTOINCREMENT,
#     name VARCHAR(255),
#     email VARCHAR(255),
#     password VARCHAR(255)
#   );
# SQL

# # inserir dados
# db.execute <<~SQL
#   INSERT INTO users (name, email, password) VALUES ('John Doe', 'johndoe@email.com', '123');
# SQL

# ler dados
db.execute('SELECT * FROM users') do |row|
  puts row.inspect
end

db.close