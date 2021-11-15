class Person
    # variables
    attr_accessor :name, :age
    attr_reader :id 

    # constructor
    def initialize(name = 'Unknow', age, parent_permission: true)

        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission 
    end 
    
end