require_relative '../memory/author_memory'
require_relative '../classes/author'

module AuthorInputs
    include AuthorMemory


    def check_authors
        saved_authors = show_authors
        author_selected = nil
    
        if saved_authors.empty?
          author_selected = new_author
        else
    
          author_selected = saved_authors.length + 1
          while author_selected > saved_authors.length
            puts "\nSelect an option from the list [AUTHOR]: "
            saved_authors.each do |author|
              print "#{saved_authors.find_index(author)}) "
              print "First Name: #{author.first_name}, Last Name: #{author.last_name}\n"
            end
            print "#{saved_authors.length}) "
            print "Add new author\n"
            author_selected = gets.chomp.to_i
          end
    
          if author_selected == saved_authors.length
            author_selected = new_author
          else
            author_selected = saved_authors[author_selected]
          end
        end
        author_selected
      end
    
    
        def new_author 
            
          puts 'Please enter the Author name'
          print 'First Name: '
          author_first_name = gets.chomp
          print 'Last Name: '
          author_last_name = gets.chomp
          author_selected = Author.new(author_first_name, author_last_name)
          add_author(author_selected)
          author_selected
    
        end
end
  