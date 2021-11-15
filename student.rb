class Student < Person
    # constructor
    def initialize(age, classroom, name = 'Unknown', parent_permission = true)
        super(name, age, parent_permission)
        @classroom = classroom
    end 
end