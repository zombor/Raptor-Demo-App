module MyKissList
  module Context
    class CreateUser
      def self.execute(user, params)
        if params['email'].empty? || params['password'].empty?
          raise Error::Validation.new(
            {:email => params['email'].empty?, :password => params['password'].empty?}
          )
        end

        user.email = params['email']
        user.password = params['password']
        user.extend(UnregisteredUser).register

        {:status => :success, :user => @user}
      end

      protected

      module UnregisteredUser
        def register
          Arden::Repository.for(:user).create(self)
        end
      end
    end
  end
end

module Error
  class Validation < Exception
    attr_reader :errors

    def initialize(errors)
      @errors = errors
    end
  end
end
