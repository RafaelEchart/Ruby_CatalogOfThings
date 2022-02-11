# rubocop:disable Style/ClassVars
module AuthorMemory
  @@author = []

  def add_author(new_author)
    @@author << new_author
  end

  def show_authors
    @@author
  end
end
# rubocop:enable Style/ClassVars
