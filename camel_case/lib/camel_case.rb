class CamelCase
  def convert(str)
    result = str
    hasMatched = str =~ /^(?!_)(\w+)_(\w+)(?<!_)$/
    if !hasMatched.nil?
      matches = str.scan(/^(?!_)(\w+)_(\w+)(?<!_)$/)
      matches.each do |groups| 
        pre = convert(groups[0])
        preHasMatched = pre =~ /([A-Za-z0-9]+)_*/
        if preHasMatched
          preResult = ''
          pre.scan(/([A-Za-z0-9]+)_*$/) do |pre_matches|
            puts('PRE MATCHES')
            print(pre_matches)
            preResult = preResult + pre_matches[0]
          end
          pre = preResult
        end
        post = groups[1].capitalize
        result = pre + post
      end
    end
    result
  end
end
