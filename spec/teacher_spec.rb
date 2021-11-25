require_relative '../teacher'

describe Teacher do
  before(:each) do
    @teach = Teacher.new(age: 33, specialization: 'History', name: 'Mrs Aka')
  end

  it ' show instance of teacher class' do
    expect(@teach).to be_instance_of Teacher
  end

  it 'show inheritance from person class' do
    expect(@teach).to be_kind_of Person
  end

  it 'confirm age to be 33' do
    expect(@teach.age).to eql 33
  end

  it 'confirm name not to be Mrs Aka' do
    expect(@teach.name).to match 'Mrs Aka'
  end

  it 'confirms specialization of teacher to be History' do
    expect(@teach.specialization).to match 'History'
  end
end
