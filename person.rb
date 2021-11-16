require './corrector'

class Person
  # variables
  attr_accessor :name, :age
  attr_reader :id

  # constructor
  def initialize(age, name = 'Unknow', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission == true
  end

  def validate_name
    validate = @corrector
    @name = validate.correct_name(@name)
  end

  private :of_age?
end

me = Person.new(14, 'Yannick')
p me.validate_name
