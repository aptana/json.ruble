require 'ruble'

command t(:reformat) do |cmd|
  cmd.key_binding = 'CONTROL+M2+H'
  cmd.scope = 'source.json'
  cmd.output = :replace_selection
  cmd.input = :selection
  cmd.invoke do
    require 'strscan'
    require 'indent'
    
    s = StringScanner.new(STDIN.read)
    brace_stack = []
    comma_needed = false
    first_line = true
    @indent_level = 0
    until s.eos?
      if s.scan(/\{/m)
        if comma_needed then puts "," else puts end
        comma_needed = false
        print indent(@indent_level) + "{"
        first_line = false
        @indent_level += 1
        brace_stack.push "{"
      elsif s.scan(/\}/m)
        @indent_level -= 1
        print "\n" + indent(@indent_level) + "}"
        if (b = brace_stack.pop) != "{"
          puts "Expected '}' (#{brace_stack.inspect} / #{b})"
          exit -1
        end
      elsif s.scan(/\[/m)
        if comma_needed then puts "," else puts end
        comma_needed = false
        print indent(@indent_level) + "["
        @indent_level += 1
        brace_stack.push "["
      elsif s.scan(/\]/m)
        @indent_level -= 1
        print "\n" + indent(@indent_level) + "]"
        if (b = brace_stack.pop) != "["
          puts "Expected ']' (#{brace_stack.inspect} / #{b})"
          exit -2
        end
      elsif s.scan(/,/m)
        comma_needed = true
        #print "==#{brace_stack.inspect}=="
        #puts (brace_stack.last == "{" ? "" : indent(@indent_level)) + ","
      else
        if comma_needed then puts "," else puts end
        comma_needed = false
        print indent(@indent_level) + s.scan(/[^{}\[\],]+/m)
      end
    end
  end
end
