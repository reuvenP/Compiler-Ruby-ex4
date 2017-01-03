require './JackTokenizer'
class CompilationEngine

  def initialize(path)
    JackTokenizer.new(path)
    @all_files = Dir.entries(path).select{|f| f.end_with? 'T.xml'}
    @all_files.each {|file|
      puts path + "\\" + file
    }
  end
end

CompilationEngine.new('C:\Users\reuvenp\Downloads\compilers\ex4\compiled\ArrayTest')