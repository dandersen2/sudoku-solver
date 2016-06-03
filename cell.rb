class Cell
  attr_reader :index, :row, :col, :box
  attr_accessor :value, :possibilities

  def initialize(args={})
    @index = args.fetch(:index)
    @value = args.fetch(:value)
    @row = args.fetch(:row)
    @col = args.fetch(:col)
    @box = args.fetch(:box)
    @possibilities = args.fetch(:possibilities)
  end
end
