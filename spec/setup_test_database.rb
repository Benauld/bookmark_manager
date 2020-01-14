require 'pg'

def setup_test_database
connection = PG.connect(dbname: 'bookmark_manager_test')
p "This is when I'm truncating"
connection.exec("TRUNCATE bookmarks;")
end
