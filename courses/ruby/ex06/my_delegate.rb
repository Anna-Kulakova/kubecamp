module MyModule
  def my_delegate(*methods, to:)
    methods.each {|method|
      define_method(method.to_s) {
        instance_variable_get(to).send(method)
      }
    }
  end
end
