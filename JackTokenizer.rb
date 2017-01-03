
class JackTokenizer

  @token_types = {KEYWORD: 'keyword', SYMBOL: 'symbol', IDENTIFIER: 'identifier', INT_CONST: 'integerConstant', STRING_CONST: 'stringConstant'}
  @keywords = {CLASS: 'class', METHOD: 'method', FUNCTION: 'function', CONSTRUCTOR: 'constructor',  INT: 'int',
               BOOLEAN: 'boolean', CHAR: 'char', VOID: 'void', VAR: 'var', STATIC: 'static', FIELD: 'field',
               LET: 'let', DO: 'do', IF: 'if', ELSE: 'else', WHILE: 'while', RETURN: 'return', TRUE: 'true',
               FALSE: 'false', NULL: 'null', THIS: 'this'}
  @symbols = %w|{ } ( ) [ ] . , ; + - * / & \| < > = - |

  def initialize(path) #Constructor. Opens the input file/stream and gets ready to tokenize it.
    @all_files = Dir.entries(path).select{|f| f.end_with? '.jack'}
    for file in @all_files
      tokenize_file(path + "\\" + file)
    end
  end

  def tokenize_file(path)
    tokens = []
    token = ''
    state = 0
    stream = File.read(path)
    stream = stream.gsub(/\/\/[^\n]*\n/, '') #remove single-line comment
    stream = stream.gsub(/(\/\*([^*]|[\r\n]|(\*+([^*\/]|[\r\n])))*\*+\/)/, '') #remove multi-line comment
    stream = stream.gsub(/[\n\r\t]+/, ' ') #remove new lines and tabs
    stream = stream.gsub(/\s+/, ' ') #all spaces to single space
    stream.each_char do |c|
      puts(c)
      case state
        when 0
          if c =~ /[0-9]/
            state = 3
            token << c
          end
          if c == "\""
            state = 5
          end
          if @symbols.include? c
            tokens.push({Type: @token_types[:SYMBOL], Value: c})
          end
      end
    end
    puts(stream)
  end

  def has_more_tokens #Do we have more tokens in the input?

  end

  def advance #Gets the next token from the input and makes it the current token. This method should only be called if hasMoreTokens() is true. Initially there is no current token.

  end

  def token_type #Returns the type of the current token.

  end

  def keyword #Returns the keyword which is the current token. Should be called only when tokenType() is KEYWORD.

  end

  def symbol #Returns the character which is the current token. Should be called only when tokenType() is SYMBOL.

  end

  def identifier #Returns the identifier which is the current token. Should be called only when tokenType() is IDENTIFIER

  end

  def int_val #Returns the integer value of the current token. Should be called only when tokenType() is INT_CONST

  end

  def string_val #Returns the string value of the current token, without the double quotes. Should be called only when tokenType() is STRING_CONST

  end

end

test = JackTokenizer.new('C:\Users\reuvenp\Downloads\compilers\PofPLmaterial-5775\Exercises\Targil4\project 10\ExpressionlessSquare')
