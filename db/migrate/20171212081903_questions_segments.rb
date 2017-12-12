class QuestionsSegments < ActiveRecord::Migration[5.1]
  def change
    create_table :questions_segments, id: false do |t|
      t.belongs_to :segment, index: true
      t.belongs_to :question, index: true
    end
  end
end
