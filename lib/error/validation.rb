module Error
  class Validation < RuntimeError
    attr_reader :errors

    def initialize(errors)
      @errors = errors
    end
  end
end
