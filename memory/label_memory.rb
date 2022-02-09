# rubocop:disable Style/ClassVars
module LabelMemory
  @@labels = []

  def add_label(new_label)
    @@labels << new_label
  end

  def show_labels
    @@labels
  end
end
# rubocop:enable Style/ClassVars
