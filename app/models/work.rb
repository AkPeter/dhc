class Work < ApplicationRecord

  belongs_to :user

  validates_presence_of :title, :content

  private

end
