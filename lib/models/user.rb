require 'virtus'

module MyKissList
  module Records
    class User
      include Virtus

      attribute :id, Integer
      attribute :email, String
      attribute :password, String
    end
  end
end
