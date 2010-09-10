module InlineExamples
  @@examples = {}
  @@accumulate = false

  def run_examples
    @@examples.each do |klass, klass_examples|
      puts "running examples for #{klass.name}"
      klass_examples.each do |e|
        puts e[0]
        puts e[1].call ? "pass!" : "fail!"
      end
    end
  end

  def for_example(desc, &block)
    return unless @@accumulate
    puts "an example found: #{desc}"
    @@examples[self] ||= []
    @@examples[self] << [desc, block]
  end

  def with_example_accumulation
    old = @@accumulate
    @@accumulate = true
    yield
    @@accumulate = old
  end

end
