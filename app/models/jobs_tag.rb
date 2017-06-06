class JobsTag < ActiveRecord::Base
  belongs_to :job
  belongs_to :tag 


  def tag_count(tag)
    JobsTag.where(tag_id: tag.id).count
  end
end
