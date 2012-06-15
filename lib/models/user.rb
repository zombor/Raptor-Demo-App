require 'virtus'
require 'aequitas'

module MyKissList
  module Records
    class User
      include Virtus
      include Aequitas

      attribute :id, Integer
      attribute :username, String
      attribute :email, String
      attribute :password, String
      attribute :first_name, String
      attribute :last_name, String
      attribute :dob, DateTime
      attribute :gender, String

      validates_presence_of :username
    end
  end
end
