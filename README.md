# TextGenerator

A gem to automatically generate text, using various schemes.
At the moment, the only scheme available is a Markov-like algorithm, but more are to come soon.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'text_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install text_generator

## Usage

### Markov Generator
Three simple steps: 

First you need to initiate a new generator. The default values are an ngram of size 1 and a maximum length of text generated of 15 words. Play with those value to get the best results depending on your source text.
```ruby
generator = MarkovGenerator.new(n = 1, genmax = 15)
```

Second you need to feed the generator some source text for it to be able to output something original later.
```ruby
generator.feed(line)
```

Finally, generate a brand new piece of text, unknown until now to all humanity, past, present and future.

```ruby
generator.generate
```

Voila.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/text_generator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
