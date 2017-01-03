require './JackTokenizer'
require 'rexml/document'

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
    doc = REXML::Document.new(tokens)
    root = doc.root
    root.elements.each {|token|
      puts token.name << ': ' << token.text[1..-2]
    }
  end

end

CompilationEngine.new('C:\Users\reuvenp\Downloads\compilers\ex4\compiled\ArrayTest')