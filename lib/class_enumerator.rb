class Object
  def contained_constants_of_type(type)
    self.constants.map { |co| self.const_get(co) }.select { |co| co.is_a? type }
  end
  def contained_classes; self.contained_constants_of_type(Class); end
  def contained_modules; self.contained_constants_of_type(Module); end
end

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
    @modules ||= enumerate_modules(@module)
  end

  private

  def enumerate_modules(klass=nil)
    klass ||= @module
    @modules ||= []
    contained_modules = klass.contained_modules
    new_modules = contained_modules - @modules
    @modules += new_modules
    new_modules.each do |m|
      enumerate_modules(m)
    end
    @modules.uniq
  rescue => e
    raise e.class, e.message + " when enumerating #{klass}", e.backtrace
  end
end
