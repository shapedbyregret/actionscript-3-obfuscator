### Actionscript 3.0 Obfuscator

Homepage: http://github.com/shapedbyregret/actionscript-3-obfuscator/tree/master

Options: There are currently only 4 options that you can change by setting them to either "True" or "False".

```
removeComments: When set to "True", will remove all comments from your .as file. This includes both block comments (all text between "/*" and "*/") and single line comments (all text following "//").

changeVarName: Changes all variable, constant, and function names to a random number prefixed with an underscore. Eg "var aNumber:int" becomes "var _324:int".

encodestrings: Converts string literals into their hex equivalent. Eg. "apple" becomes "\x61\x70\x70\x6c\x65"

skipPublic: Skips variable, constant, or function if they are public. This should help with protecting public APIs from being obfuscated.
```

If the keyword "!reserved" appears in a line, it will be skipped. This allows you to opt lines in/out of obfuscation. For example, the following variable would not be obfuscated. If "removeComments" is enabled, it will remove the `//!reserved` comment.
```
var testStr:String = 'test'; //!reserved
```


Instructions: To run the script, open a terminal and type in:
```
$ python /path/to/obfuscator.py /path/to/Filename.as /path/to/NewFilename.as
```

So to test the examples provided, you would open a terminal in the folder where obfuscator.py is located and type:
```
$ python obfuscator.py example/Bubble_Sort.as example/Bubble_Sort_Obfs.as
```

If a new file name is not provided, the script will automatically write to Filename_Obfs.as. The script will change the constructor name to match your new filename as well.

Notes: Script was developed using Python 2.6 and has not been tested with any other versions. If you run into any errors, feel free to contact me at the e-mail address above.
