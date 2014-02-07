class ItemParser
  token 'item'  WORD
  rule
    catalog: item | item catalog;
    item: 'item' WORD {@result << Item.new(val[1])};
end

---- inner
def make_tokens str
  require 'strscan'
  result = []
  scanner = StringScanner.new str
  until scanner.empty?
    case
      when scanner.scan(/\s+/)
        #ignore whitespace
      when match = scanner.scan(/item/)
        result << ['item', nil]
      when match = scanner.scan(/\w+/)
        result << [:WORD, match]
      else
        raise "can't recognize <#{scanner.peek(5)}>"
    end
  end
  result << [false, false]
  return result
end

attr_accessor :result

def parse(str)
  @result = Catalog.new
  @tokens = make_tokens str
  do_parse
end

def next_token
 @tokens.shift
end
