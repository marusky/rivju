class Submission < ApplicationRecord
  belongs_to :project
  has_one_attached :file

  enum version: {
    first: 1,
    second: 2
  }, _prefix: true
end
