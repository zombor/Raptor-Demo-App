require 'error/validation'
require 'models/user'
require 'delegate'
require 'dci'

module MyKissList
  module Context
    class CreateUser < DCI::Context

      def self.execute(user, params)
        self.new.execute(user, params)
      end

      entry :execute do |user, params|
        self.UnregisteredUser = user
        UnregisteredUser.register(params)
      end

      role :UnregisteredUser do
        def register(params)
          self.attributes = params
          Arden::Repository.for(:user).create(self)
        end
      end
    end
  end
end
