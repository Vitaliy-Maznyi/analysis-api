class Correlation
  def initialize(dataset_1, dataset_2)
    @dataset_1 = dataset_1.split(",").map! { |i| i.to_f}
    @dataset_2 = dataset_2.split(",").map! { |i| i.to_f}
  end

  def correlate # x == dataset1 and y == dataset2
    average_x = @dataset_1.sum / @dataset_1.length
    average_y = @dataset_2.sum / @dataset_2.length
    deviation_x = @dataset_1.map { |i| i - average_x }
    deviation_y = @dataset_2.map { |i| i - average_y }
    multiplication = [] # array of deviation_x[i] * deviation_y[i]
    deviation_x.zip(deviation_y).each { |x, y| multiplication.push(x*y) }
    deviation_x_square = deviation_x.map { |i| i**2 }
    deviation_y_square = deviation_y.map { |i| i**2 }
    multiplication.sum / Math.sqrt(deviation_x_square.sum * deviation_y_square.sum)
  end

end