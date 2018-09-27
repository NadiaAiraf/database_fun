require 'pg'

def empty_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks CASCADE;")
end

def add_bookmarks
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks(id, url, title) values(1, 'http://google.com','google');")
  connection.exec("INSERT INTO bookmarks(id, url, title) values(2, 'http://facebook.com','facebook');")
  connection.exec("INSERT INTO bookmarks(id, url, title) values(3, 'http://twitter.com','twitter');")
  connection.exec("INSERT INTO bookmarks(id, url, title) values(4, 'http://youtube.com','youtube');")
end
