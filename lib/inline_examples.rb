module InlineExamples
  @@examples = {}

  def run_examples
    puts "running examples for #{self.name}"
    @@examples[self].each do |e|
      puts e[0]
      puts e[1].call ? "pass!" : "fail!"
    end
  end

  def for_example(desc, &block)
    puts "an example found: #{desc}"
    @@examples[self] ||= []
    @@examples[self] << [desc, block]
  end
end
