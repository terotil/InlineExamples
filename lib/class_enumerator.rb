module ObjectSpace
  def self.classes
    klasses = []
    each_object(Class) { |c| klasses << c }
    klasses
  end
end
