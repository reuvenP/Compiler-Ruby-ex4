
class JackTokenizer

  @token_types = {KEYWORD: 'keyword', SYMBOL: 'symbol', IDENTIFIER: 'identifier', INT_CONST: 'integerConstant', STRING_CONST: 'stringConstant'}
  @keywords = {CLASS: 'class', METHOD: 'method', FUNCTION: 'function', CONSTRUCTOR: 'constructor',  INT: 'int',
               BOOLEAN: 'boolean', CHAR: 'char', VOID: 'void', VAR: 'var', STATIC: 'static', FIELD: 'field',
               LET: 'let', DO: 'do', IF: 'if', ELSE: 'else', WHILE: 'while', RETURN: 'return', TRUE: 'true',
               FALSE: 'false', NULL: 'null', THIS: 'this'}

  def initialize(path) #Constructor. Opens the input file/stream and gets ready to tokenize it.
    @all_files = Dir.entries(path).select{|f| f.end_with? '.jack'}
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
