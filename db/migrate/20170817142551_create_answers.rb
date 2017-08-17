class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :description

      t.references :user, index: true
      t.references :question, index: true

      t.references :commentable, polymorphic: true, index: true
      t.references :voteable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
