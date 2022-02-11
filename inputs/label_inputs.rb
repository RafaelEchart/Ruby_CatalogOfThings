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
        show_saved_labels(saved_labels)
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

  def show_saved_labels(data)
    puts "\nSelect an option from the list [LABEL]: "
    data.each do |label|
      print "#{data.find_index(label)}) "
      print "Title: #{label.title}, Color: #{label.color}\n"
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
