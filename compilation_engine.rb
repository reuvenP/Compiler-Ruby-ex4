require './JackTokenizer'

class CompilationEngine

  def initialize(path)
    JackTokenizer.new(path)
    @all_files = Dir.entries(path).select{|f| f.end_with? 'T.xml'}
    @all_files.each {|file|
      tokens_stream = File.read(path + "\\" + file)
      tree = compile_class(tokens_stream)
    }
  end

  def compile_class(tokens) #Compiles a complete class.

  end

end

CompilationEngine.new('C:\Users\reuvenp\Downloads\compilers\ex4\compiled\ArrayTest')