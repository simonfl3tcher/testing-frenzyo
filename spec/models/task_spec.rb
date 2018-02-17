require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:project) { FactoryGirl.create(:project) }

  it 'is valid with a project and a name' do
    task = Task.new(
      project: project,
      name: 'My Task Name'
    )

    expect(task).to be_valid
  end

  it 'is invalid without a project' do
    task = Task.new(project: nil)
    task.valid?
    expect(task).to_not be_valid
  end

  it 'is invalid without a name' do
    task = Task.new(name: nil)
    task.valid?
    expect(task).to_not be_valid
  end
end
