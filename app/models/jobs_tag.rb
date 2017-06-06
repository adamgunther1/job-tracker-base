class JobsTag < ActiveRecord::Base
  belongs_to :job
  belongs_to :tag 

  def self.tag_count(tag)
    where(tag_id: tag.id).count
  end

end
