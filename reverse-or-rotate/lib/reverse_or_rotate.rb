class RevRot

  def break_input(str, sz)
    str.strip!
    return if str.length < sz
    result = []
    start = 0
    while (str.length - start) >= sz
      chunk = str.slice(start, sz)
      result.push(chunk)
      start = start + sz
    end
    result
  end

  def convert_chunk_to_numbers(chunk)
    return if !chunk.is_a? String or !/\A\d+\z/.match(chunk)
    result = chunk.split('')
    result = result.map { |str| str.to_i}
  end

  def sum_of_cubes(numList)
    return nil if numList.nil? or !numList.all? {|num| num.is_a?(Integer)}
    numList.reduce(0) {|sum, num| sum + num ** 3}
  end

  def rotate_left(num_list)
    return if num_list.nil? or !num_list.kind_of?(Array) or (num_list.kind_of?(Array) and !num_list.all? {|num| num.is_a?(Integer)})
    head = num_list[0]
    tail = num_list.slice(1, num_list.length - 1)
    result = []
    result = (result + tail)
    result = result << head
    result
  end

  def main(str, sz)
    return '' if str.length < sz or sz == 0
    str_chunks = break_input(str, sz)
    num_chunks = str_chunks.map{|chunk| convert_chunk_to_numbers(chunk)}
    cubes = num_chunks.map {|num_list| sum_of_cubes(num_list) }
    result = ''
    cubes.each_with_index do |c,i|
      if c % 2 == 0
        result = result + str_chunks[i].reverse
      else
        num_list_rot = rotate_left(num_chunks[i])
        reversed = num_list_rot.reduce('') { |acc, num| acc + "#{num}" }
        result = result + reversed
      end
    end
    result
  end

end
