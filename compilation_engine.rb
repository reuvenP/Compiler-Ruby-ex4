require './JackTokenizer'
require 'rexml/document'

class CompilationEngine

  def initialize(path)
    JackTokenizer.new(path)
    @all_files = Dir.entries(path).select{|f| f.end_with? 'T.xml'}
    @all_files.each {|file|
      @tokens_array = []
      @parse_tree = []
      tokens_stream = File.read(path + "\\" + file)
      doc = REXML::Document.new(tokens_stream)
      root = doc.root
      root.elements.each {|token|
        elem = [token.name, token.text[1..-2]]
        @tokens_array.push(elem)
      }
      tree = compile_class
      out_file = path + "\\" + file[0..-6] + '.xml'
      File.open(out_file, 'w') do |f|
        f.puts(tree)
      end
      puts tree
      #tree.write($stdout, 1)
    }
  end

  def next_token
    if @tokens_array.empty?
      nil
    else
      @tokens_array[0]
    end
  end

  def get_next_token
    if next_token == nil
      nil
    else
      @tokens_array.shift
    end
  end

  def get_next_token_element
    cur = get_next_token
    elem = REXML::Element.new(cur[0])
    elem.text = ' ' << cur[1] << ' '
    elem
  end

  def compile_class #Compiles a complete class.
    base = REXML::Element.new('class')
    base.add_element(get_next_token_element) #'class'
    base.add(get_next_token_element) #className
    base.add(get_next_token_element) #'{'
    while next_token[1] == 'static' or next_token[1] == 'field' #classVarDec*
      base.add(compile_class_var_dec)
    end
    while next_token[1] == 'constructor' or next_token[1] == 'function' or next_token[1] == 'method' #subroutineDec*
      base.add(compile_subroutine)
    end
    base.add(get_next_token_element) #'}'
    base
  end

  def compile_class_var_dec #Compiles a static declaration or a field declaration.
    base = REXML::Element.new('classVarDec')
    base.add(get_next_token_element) #('static' | 'field')
    base.add(get_next_token_element) #type
    base.add(get_next_token_element) #varName
    while next_token[1] == ',' #(',' varName)*
      base.add(get_next_token_element) #','
      base.add(get_next_token_element) #varName
    end
    base.add(get_next_token_element) #';'
    base
  end

  def compile_subroutine #Compiles a complete method, function, or constructor.
    base = REXML::Element.new('subroutineDec')
    base.add(get_next_token_element) #('constructor' | 'function' | 'method')
    base.add(get_next_token_element) #('void' | type)
    base.add(get_next_token_element) #subroutineName
    base.add(get_next_token_element) #'('
    base.add(compile_parameter_list) #parameterList
    base.add(get_next_token_element) #')'
    base.add(compile_subroutine_body) #subroutineBody
    base
  end

  def compile_parameter_list #Compiles a (possibly empty) parameter list, not including the enclosing “()”.
    base = REXML::Element.new('parameterList')
    if next_token[1] != ')' #param list not empty
      base.add(get_next_token_element) #type
      base.add(get_next_token_element) #varName
      while next_token[1] == ','
        base.add(get_next_token_element) #','
        base.add(get_next_token_element) #type
        base.add(get_next_token_element) #varName
      end
    end
    base
  end

  def compile_subroutine_body
    base = REXML::Element.new('subroutineBody')
    base.add(get_next_token_element) #'{'
    while next_token[1] == 'var' #varDec*
      base.add(compile_var_dec)
    end
    base.add(compile_statements) #statements
    base.add(get_next_token_element) #'}'
    base
  end

  def compile_var_dec #Compiles a var declaration.
    base = REXML::Element.new('varDec')
    base.add(get_next_token_element) #'var'
    base.add(get_next_token_element) #type
    base.add(get_next_token_element) #varName
    while next_token[1] == ','
      base.add(get_next_token_element) #,
      base.add(get_next_token_element) #varName
    end
    base.add(get_next_token_element) #';'
    base
  end

  def compile_statements #Compiles a sequence of statements, not including the enclosing “{}”.
    base = REXML::Element.new('statements')
    while next_token[1] == 'let' or next_token[1] == 'if' or next_token[1] == 'while' or next_token[1] == 'do' or next_token[1] == 'return'

    end
    base
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