class CreateJobTagsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :tags, :jobs do |t|
      t.references :tag, foreign_key: true
      t.references :job, foreign_key: true
    end
  end
end
