module MyModule
  def my_method(arg1)
    arg1.make_it
  end
end
include MyModule

describe MyModule do
  it 'calls make_it' do
    my_arg = double
    my_arg.should_receive(:make_it)
    MyModule.my_method(my_arg)
  end
end

