echo %%% RAKEXT TRANSFORMS YOUR METHODS IN RAKE TASKS %%%
echo
echo $ rakext -T
RUBYLIB=../lib ../bin/rakext -T
echo

echo %%% YOU CAN PASS ARGUMENTS IN RUBY CODE %%%
echo
echo $ rakext my_pref:task_a RUBY_ARGS=\'\{a:4,b:3\'\}
RUBYLIB=../lib ../bin/rakext my_pref:task_a RUBY_ARGS='{a:4,b:3}'
echo

echo $ rakext my_pref:task_a RUBY_ARGS=\"a:4,b:3\"
RUBYLIB=../lib ../bin/rakext my_pref:task_a RUBY_ARGS="a:4,b:3"
echo

echo $ rakext my_pref:task_a RUBY_ARGS='(a:"4",b:3)'
RUBYLIB=../lib ../bin/rakext my_pref:task_a RUBY_ARGS='(a:"4",b:3)'
echo

echo $ rakext top_level:nested_namespace:task_b RUBY_ARGS=\'1,2,3\'
RUBYLIB=../lib ../bin/rakext top_level:nested_namespace:task_b RUBY_ARGS='1,2,3'
echo

echo $ rakext top_level:nested_namespace:task_b RUBY_ARGS=\'[1,2,3], \"foo\", \"bar\"\'
RUBYLIB=../lib ../bin/rakext top_level:nested_namespace:task_b RUBY_ARGS='[1,2,3], "foo", "bar"'
echo

echo %%% YOU CAN PASS ARGUMENTS IN YAML %%%
echo
echo $ rakext my_pref:task_a YAML_ARGS=\'---
echo :a: 4
echo :b: 3
echo \'
RUBYLIB=../lib ../bin/rakext get_args YAML_ARGS='---
:a: 4
:b: 3
'
echo
echo %%% YOU CAN PASS ARGUMENTS IN JSON %%%
echo

echo $ rakext my_pref:task_a JSON_ARGS=\'
echo {\"a\": 4, \"b\": 3}
echo \'
RUBYLIB=../lib ../bin/rakext my_pref:task_a JSON_ARGS='
{"a": 4, "b": 3}
'
echo
