require 'pg'

def empty_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks CASCADE;")
end

def add_bookmarks
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks values (1,'aidan');")
  connection.exec("INSERT INTO bookmarks values (2,'tom');")
  connection.exec("INSERT INTO bookmarks values (3,'makers');")
  connection.exec("INSERT INTO bookmarks values (4,'academy');")
end
