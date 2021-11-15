class Teacher < Person
    # contructor
    def initialize(specialization, name = 'unknown', parent_permission: true)
        super(name, age, parent_permission)
        @specialization = specialization
    end
end