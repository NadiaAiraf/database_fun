require 'pg'

def empty_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks CASCADE;")
  connection.exec("TRUNCATE comments CASCADE;")
end

def add_bookmarks
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks(id, url, title) values(1, 'http://google.com','google');")
  connection.exec("INSERT INTO bookmarks(id, url, title) values(2, 'http://facebook.com','facebook');")
  connection.exec("INSERT INTO bookmarks(id, url, title) values(3, 'http://twitter.com','twitter');")
  connection.exec("INSERT INTO bookmarks(id, url, title) values(4, 'http://youtube.com','youtube');")
end

def add_comments
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO comments(id, text, bookmark_id) values(1,'google is freaking awesome',1)")
  connection.exec("INSERT INTO comments(id, text, bookmark_id) values(2,'facebook is ok',2)")
  connection.exec("INSERT INTO comments(id, text, bookmark_id) values(3,'I hate twitter',3)")
  connection.exec("INSERT INTO comments(id, text, bookmark_id) values(4,'youtube is amazing',4)")
  connection.exec("INSERT INTO comments(id, text, bookmark_id) values(5,'but it doesnt',4)")
  connection.exec("INSERT INTO comments(id, text, bookmark_id) values(6,'keepy music open',4)")
end
