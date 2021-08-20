# Simplecov_covview

simplecov_covview is a coverage viewer for SimpleCov.

This formatter Generates a console report of your SimpleCov ruby code coverage results on Ruby.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecov_covview'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simplecov_covview

## Usage

```ruby
SimpleCov.formatter = SimpleCov::Formatter::CovView
# or
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::CovView
  ])
```

Example output:

```text

----- file => foo.rb -----
4 lines covered and 1 lines missed.
line#   status   count  code
   1: [  never] [   - ] # foo.rb
   2: [covered] [   1 ] def foo(n)
   3: [covered] [  10 ]   if n <= 10
   4: [covered] [  10 ]     p "n < 10"
   5: [  never] [   - ]   else
   6: [ missed] [   0 ]     p "n >= 10"
   7: [  never] [   - ]   end
   8: [  never] [   - ] end
   9: [  never] [   - ]
  10: [covered] [  11 ] (1..10).each {|x| foo(x)}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/icm7216/simplecov_covview.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
