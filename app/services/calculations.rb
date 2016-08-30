class Calculations

  def initialize(data)
    @data = data.split(",").sort.map! { |i| i.to_f}
  end

  def divide_array(array)
    arr = array.dup
    arr.each_slice(arr.length / 2).to_a
  end

  def calculate_quartile(array)
    if (array.length % 2 ) == 0
      ( array[ (array.length / 2).floor ] + array[ (array.length / 2).floor - 1 ] ) / 2
    else
      array[array.length / 2]
    end
  end

  def find_median(array)
    if (array.length % 2) == 0
      half_array = divide_array(array)
      (half_array[0].last + half_array[1].first) / 2
    else
      array[array.length / 2]
    end
  end

  def find_Q1(array)
    array = divide_array(array)
    calculate_quartile(array[0])
  end

  def find_Q3(array)
    array = divide_array(array)
    if (array.length % 2) != 0
      array[1].shift
      array[1] = array[1] + array[2]
    end
    calculate_quartile(array[1])
  end

  def outliers(data)
    list = []
    q1 = find_Q1(data)
    q3 = find_Q3(data)
    low = q1 - 1.5 * (q3 - q1)
    high = q3 + 1.5 * (q3 - q1)
    data.each do |e|
      if (low..high).exclude?(e)
        list.push(e)
      end
    end
    list
  end

  def average_value(data)
    data.sum / data.length
  end

  def perform(datum = {})
    datum['dataset'] = @data
    datum['min'] = @data.min
    datum['max'] = @data.max
    datum['average'] = average_value(@data)
    datum['Q1'] = find_Q1(@data)
    datum['median'] = find_median(@data)
    datum['Q3'] = find_Q3(@data)
    datum['outliers'] = outliers(@data)
    return datum
  end

end