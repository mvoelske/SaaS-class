class CartesianProduct
  include Enumerable
  # your code here
  def initialize(seq1, seq2)
    @seq1 = seq1
    @seq2 = seq2
  end
  def each
    @seq1.each do |a|
      @seq2.each do |b|
        yield [a,b]
      end
    end
  end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)
