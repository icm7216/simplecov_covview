# foo.rb
def foo(n)
  if n <= 10
    p "n < 10"
  else
    p "n >= 10"
  end
end

(1..10).each {|x| foo(x)}
