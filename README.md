# Deprecated
This project is no longer maintained. No new issues or pull requests will be accepted. You can still use the source or fork the project to suit your needs.

# Frog

Frog is a command line tool to help you quickly jump to the right Android doc.

![Frog demo](https://raw.githubusercontent.com/anupcowkur/frog/master/frog_demo.gif)

## Installation

Make sure you [have ruby first](https://www.ruby-lang.org/en/documentation/installation/). 

Note: This library has been tested with `ruby 2.3.0`.

And then execute:

	$ gem install frog

## Usage
### Fuzzy search mode
Just give frog an android class to search for and it'll give you a list.

For example:

	$ frog preferences

will give you a list of preference related classes and ask you to pick one. Enter one of the shown indices and frog will launch the correct doc for you.

### Exact search mode
If you know what you're looking for and would like to go the exact doc of the class then you can use `-e` flag to do just that.

For example:

	$ frog -e Activity

will take you to the `Activity` class documentation.

### Help
You can always use

	$ frog -h 

to look up the usage.

## Contributing

Bug reports and pull requests are welcome.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

