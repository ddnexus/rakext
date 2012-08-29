# rakext

Lite and powerful rake extension.

Rakext allows you to create rake tasks by just writing methods. Besides, you can pass tasks arguments as ruby code, YAML or JSON strings and they will be evaluated as you expect.

## Installation

```sh
$ gem install rakext
```

## Task Usage

You can define your own modules and `include Rakext::Tasks` in order to create your tasks:

```ruby
# file 'my_tasks.rb'
module MyTasks
  include Rakext::Tasks
  # the default prefix would be 'my_tasks:'
  prefix 'my_pref:'

  desc 'this is the my_pref:foo - args(opts)'
  def foo(opts)
    print 'received arguments: '
    p opts
  end

  module NestedNamespace
    include Rakext::Tasks
    # uses the default prefix 'my_task:nested_namespace:'

    desc 'this is the my_task:nested_namespace:bar - args(a,b,c)'
    def bar(a, b, c)
      print 'received arguments: '
      p a, b, c
    end

  end
end
```

In the Rakefile:

```ruby
require 'rakext'
require 'my_tasks'
```

Check the tasks:

```sh
$ rake -T
rake my_pref:foo                    # this is the my_pref:foo - args(opts)
rake my_tasks:nested_namespace:bar  # this is the my_task:nested_namespace:bar - args(a,b,c)
```

## CLI Usage

A few examples about passing args:

```sh
# pure rake
$ rake my_pref:foo RUBY_ARGS='a:"foo", b: "bar"'
$ rake my_task:nested_namespace:bar RUBY_ARGS='{a:4,b:3}, "a", "b"'

# need rakext for multiline args (rake does not parse them correctly)
$ rakext my_pref:foo YAML_ARGS='
---
:a: foo
:b: bar
'

$ rakext my_task:nested_namespace:bar JSON_ARGS='
[{"a":4,"b":3}, "a", "b"]
'
```

## Try it

Look at the 2 files in [test](./rakext/blob/master/test) to see how it works. You may also run `. test.sh` to try it.

## Tips and tricks

Since the `rakext` bin is exactly the same `rake` bin with just an added `m` multiline flag, you can symlink it so you will always use `rakext` when you type `rake`.

## Copyright

Copyright (c) 2012 by [Domizio Demichelis](mailto://dd.nexus@gmail.com)<br>
See [LICENSE](./rakext/blob/master/LICENSE) for details.

