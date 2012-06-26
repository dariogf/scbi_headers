# encoding: utf-8

# A class to print information headers in all command line applications of SCBI

class ScbiHeader

  attr_accessor :description,:l1_separator_char,:l2_separator_char,:program_name,:program_version,:width

  attr_accessor :title,:authors, :articles, :copyright

  def initialize(program_name, program_version, use_default_title = true, width = 80)
    @res=[]
    @comment_char='#'
    @l1_separator_char='='
    @l2_separator_char='*'
    @l3_separator_char='-'

    @title=[]

    @copyright=''

    if use_default_title
      default_title
    end

    @authors=[]
    @articles=[]

    @program_name=program_name
    @description=description
    @program_version=program_version
    @width=width

  end

  def default_title

    @title << "SuperComputing and BioInformatics - SCBI"
    @title << "University of Málaga - Spain"
    @title << "http://www.scbi.uma.es"
  end

  def to_s
    inspect
  end

  def inspect
    populate_header
    @res.join("\n")
  end

  private


    # build the real string into @res
    def populate_header()

      separator(@l1_separator_char)

      @title.each do |title_line|
        centered_line(title_line)
      end
      separator(@l3_separator_char)
      empty_line

      name_line="#{@program_name} - version: #{@program_version}"

      if !@copyright.empty?
        name_line+=" - (c) #{@copyright}"
      end

      left_line(name_line)

      empty_line

      separator(@l3_separator_char)
      empty_line

      wrap(@description,@width).each do |line|
        left_line(line)
      end
      empty_line

      if !@authors.empty?
        separator(@l3_separator_char)

        empty_line
        left_line('Authors')

        @authors.each do |line|
          left_line(' '*6+'-'+line)
        end
      end


      if !@articles.empty?
        separator(@l3_separator_char)

        empty_line
        left_line('**NOTE: If you find this program useful, please cite the following articles:')
        empty_line
        @articles.each do |line|
          left_line(' '*6+'-'+line)
        end
      end

      separator(@l1_separator_char)


    end


    # make a simple wrap of complete words
    def wrap(s,width)
      res=[]
      lines=s.split("\n")

      lines.each do |input_line|
        words=input_line.split(/\s/)
        line=''
        words.each do |w|
          if (line.length+w.length)>(width-4)
            res << line
            line=''
          end

          line << ' '+w

        end

        if !line.empty?
          res << line
          line=''
        end

      end

      res
    end

    def separator(level_char)
      @res << @comment_char + level_char*(@width-2)+@comment_char

    end

    def add_line(line)
      @res << @comment_char + ' '+line+' '+@comment_char
    end

    def centered_line(line)
      add_line(line.center(@width-4))
    end

    def empty_line()
      centered_line('')
    end

    def left_line(line)
      add_line(line.ljust(@width-4))
    end


    def right_line(line)
      add_line(line.rjust(@width-4))
    end

end
