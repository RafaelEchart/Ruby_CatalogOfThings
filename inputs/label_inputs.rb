require_relative '../memory/label_memory'
require_relative '../classes/label'

module LabelInputs
  include LabelMemory

  def check_labels
    saved_labels = show_labels
    label_selected = nil

    if saved_labels.empty?
      new_label
    else
      label_selected = saved_labels.length + 1
      while label_selected > saved_labels.length
        puts "\nSelect an option from the list [LABEL]: "
        saved_labels.each do |label|
          print "#{saved_labels.find_index(label)}) "
          print "Title: #{label.title}, Color: #{label.color}\n"
        end
        print "#{saved_labels.length}) "
        print "Add new label\n"
        label_selected = gets.chomp.to_i
      end

      if label_selected == saved_labels.length
        new_label
      else
        saved_labels[label_selected]
      end
    end
  end

  def new_label
    print 'Please enter the Label title: '
    label_title = gets.chomp
    print 'Enter a colour: '
    label_colour = gets.chomp
    label_selected = Label.new(label_title, label_colour)
    add_label(label_selected)
    label_selected
  end
end
