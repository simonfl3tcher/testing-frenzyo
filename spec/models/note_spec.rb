require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @user = User.create(
      first_name: 'Simon',
      last_name: 'Fletcher',
      email: 'simon@mintdigital.com',
      password: '123123123'
    )

    @project = @user.projects.create(
      name: 'Test Project'
    )
  end

  # Validation Specs
  describe 'search message for term' do
    context 'when a match is found' do
      it 'returns notes that match the search term' do
        note1 = @project.notes.create(
          message: 'This is the first note',
          user: @user
        )

        note2 = @project.notes.create(
          message: 'This is the second note',
          user: @user
        )

        note3 = @project.notes.create(
          message: 'First pre-heat the oven',
          user: @user
        )

        expect(Note.search('first')).to include(note1, note3)
        expect(Note.search('first')).to_not include(note2)
      end
    end

    context 'when a match is not found' do
      it 'returns an empty collection when no results are found' do
        expect(Note.search('message')).to be_empty
      end
    end
  end
end
