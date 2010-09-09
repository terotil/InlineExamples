module ObjectSpace
  def self.classes
    l = []
    ObjectSpace.each_object(Class) { |c| l << c }
    l
  end
end
