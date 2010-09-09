class Object
  # All constants defined in this object and referencing to modules
  def module_constants
    self.constants.map do |constant|
      self.const_get(constant)
    end.select do |constant|
      constant.is_a? Module
    end
  end
end

# List all classes (or modules) inside given class (or module)
# recursively
class ClassEnumerator
  def initialize(klass=Object)
    @module  = klass
    @classes = nil
    @modules = nil
  end

  def classes
    @classes ||= modules.select { |m| m.class == Class }
  end

  def modules
    @modules ||= traverse_modules(@module)
  end

  private

  def traverse_modules(klass=nil)
    klass ||= @module
    @modules ||= []
    module_constants = klass.module_constants
    new_modules = module_constants - @modules
    @modules += new_modules
    new_modules.each do |m|
      traverse_modules(m)
    end
    @modules.uniq
  rescue => e
    raise e.class, e.message + " when enumerating #{klass}", e.backtrace
  end
end
