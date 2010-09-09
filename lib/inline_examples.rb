module InlineExamples
  def run_examples
    puts "running examples for #{self.name}"
    # todo: run accumulated examples
  end

  def for_example(desc)
    puts "an example found: #{desc}"
    # todo: accumulate example blocks
  end
end
