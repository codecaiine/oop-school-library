require_relative '../person'
require_relative '../corrector'

describe Person do
  before(:each) do
    @corrector = Corrector.new
    @person = Person.new(age: 51, name: 'zinedine', parent_permission: false)
  end

  it ' show person instance' do
    expect(@person).to be_instance_of Person
  end

  it 'name format is correct' do
    expect(@person.validate_name).to match 'Zinedine'
  end

  it 'name format is not correct' do
    expect(@person.validate_name).not_to match 'zinedine'
  end

  it 'return use_services true' do
    expect(@person.can_use_services?).to be true
  end

  it 'return use_services false' do
    person = Person.new(age: 16, name: 'zinedine', parent_permission: false)
    expect(person.can_use_services?).to be false
  end
end