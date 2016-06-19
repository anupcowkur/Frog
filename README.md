# Frog

Frog is a command line tool to help you quickly jump to the right Android doc.


## Installation

Make sure you [have ruby first](). (tested with ruby 2.3.0)

And then execute:

	$ gem install frog

## Usage
Just give frog an android class to search for and it'll give you a list.

For example:

	$ frog preferences

will give you a list of preference related classes and ask you to pick one. Enter one of the shown indices and frog will launch the correct doc for you.

If you know what you're looking for and would like to go the exact doc of the class then you can use `-e` flag to do just that.

For example:
	$ from -e Activity

will take you to the `Activity` class documentation.

You can always use `$ frog -h` to look up the usage.

## Contributing

Bug reports and pull requests are welcome.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

