$LOAD_PATH << './lib'
require 'arden'
require 'repository/datamapper/user'

Arden::Repository.add(:user => Repository::User.new)
