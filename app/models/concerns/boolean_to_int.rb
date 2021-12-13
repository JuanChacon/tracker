module BooleanToInt
    extend ActiveSupport::Concern
 
    
    #METHODS
    #pass a booleand field to return a int value
    def boolean_to_int(field)
      eval(field) ? 1 : 0
    end
  end