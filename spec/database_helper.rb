require 'pg'

def empty_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks CASCADE;")
end

def add_bookmarks
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url) values ('aidan');")
  connection.exec("INSERT INTO bookmarks (url) values ('tom');")
  connection.exec("INSERT INTO bookmarks (url) values ('makers');")
  connection.exec("INSERT INTO bookmarks (url) values ('academy');")
end
