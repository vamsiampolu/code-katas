To setup a Ruby project that uses `rspec`, do the following:

1. Check if `ruby` is installed:

```
ruby --version
```

2. Install bundler:

```
gem install bundler
```

3. Create a gemfile:

```
touch Gemfile
```

and inside it, add:

```
source "https://rubygems.org"

gem "rspec"
```

4. Install your dependencies:

```
bundle install
```

and initialize rspec helper:

```
rspec --init
```

To the file `.rspec` which should be generated in the step above, add some options:

```
--color
--format documentation
--require spec_helper
```
