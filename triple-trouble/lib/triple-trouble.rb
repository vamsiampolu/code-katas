class TripleTrouble
  def main(num1, num2)
    num1_str = num1.to_s
    num2_str = num2.to_s
    has_triple = num1_str =~ /(\d)\1{2,}/
    return 0 unless has_triple
    num1_triples = num1_str.scan(/(\d)\1{2,}/).flatten
    if num1_triples.length > 0
      num1_triples.each do |t|
        has_double = num2_str =~ /(#{t})\1{1,}/
        return 1 if has_double
      end
    end
    0
  end
end
