require 'error/validation'
require 'models/user'
require 'delegate'
require 'dci'

module MyKissList
  module Context
    class CreateUser < DCI::Context

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
