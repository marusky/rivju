class Submission < ApplicationRecord
  belongs_to :project
  has_one_attached :file

  enum version: {
    first: 1,
    second: 2
  }, _prefix: true

  def part(from_line: 1, to_line: nil)
    @_file ||= file.download.split("\n")

    to_line = @_file.length unless to_line

    @_file[(from_line - 1)..(to_line - 1)].join("\n")
  end
end
