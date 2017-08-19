class CamelCase
  def convert(str)
    result = str
    hasMatched = str =~ /^(?![_-])(\w+)[_-](\w+)(?<![_-])$/
    if !hasMatched.nil?
      matches = str.scan(/^(?![_-])(\w+)[_-](\w+)(?<![_-])$/)
      matches.each do |groups| 
        pre = convert(groups[0])
        preHasMatched = pre =~ /([A-Za-z0-9]+)[_-]*/
        if preHasMatched
          preResult = ''
          pre_matches = pre.scan(/([A-Za-z0-9]+)/)
          pre_matches.each_with_index do |match, i|
            if i > 0
              preResult = preResult + match[0].capitalize
            else
              preResult = preResult + match[0]
            end
            pre = preResult
          end
        end
        post = groups[1].capitalize
        result = pre + post
      end
    end
    result
  end
end
