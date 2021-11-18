# rubocop: disable Style/OptionalBooleanParameter

class Teacher < Person
  # contructor
  def initialize(specialization, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# rubocop: enable Style/OptionalBooleanParameter
