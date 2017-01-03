require './JackTokenizer'
require 'rexml/document'

class CompilationEngine

  def initialize(path)
    JackTokenizer.new(path)
    @tokens_array = []
    @all_files = Dir.entries(path).select{|f| f.end_with? 'T.xml'}
    @all_files.each {|file|
      tokens_stream = File.read(path + "\\" + file)
      doc = REXML::Document.new(tokens_stream)
      root = doc.root
      root.elements.each {|token|
        elem = [token.name, token.text[1..-2]]
        @tokens_array.push(elem)
      }
      compile_class
    }
  end

  def compile_class #Compiles a complete class.

  end

  def compile_class_var_dec #Compiles a static declaration or a field declaration.

  end

  def compile_subroutine #Compiles a complete method, function, or constructor.

  end

  def compile_parameter_list #Compiles a (possibly empty) parameter list, not including the enclosing “()”.

  end

  def compile_var_dec #Compiles a var declaration.

  end

  def compile_statements #Compiles a sequence of statements, not including the enclosing “{}”.

  end

  def compile_do #Compiles a do statement.

  end

  def compile_let #Compiles a let statement.

  end

  def compile_while #Compiles a while statement.

  end

  def compile_return #Compiles a return statement.

  end

  def compile_if #Compiles an if statement, possibly with a trailing else clause.

  end

  def compile_expression #Compiles an expression.

  end

  def compile_term #Compiles a term. This routine is faced with a slight difficulty when trying to decide between some of the alternative parsing rules. Specifically, if the current token is an identifier, the routine must distinguish between a variable, an array entry, and a subroutine call. A single look-ahead token, which may be one of “[“, “(“, or “.” suffices to distinguish between the three possibilities. Any other token is not part of this term and should not be advanced over.

  end

  def compile_expression_list #Compiles a (possibly empty) comma-separated list of expressions.

  end

end

CompilationEngine.new('C:\Users\reuvenp\Downloads\compilers\ex4\compiled\ArrayTest')