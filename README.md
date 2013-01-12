# Homebrew HBase Versions

[Homebrew][0] recipes for installing the latest release of various
[HBase][1] versions. These recipes allow you to keep multiple HBase
version installed simultaneously.

## Why?

* You want to get started learning HBase against a specific release
  version.
* You need to test your applications against multiple versions of
  HBase.
* Your organization don't maintain the same upgrade schedule as the
  homebrew recipe maintainers.

## How to install these recipes

The simplest way is to install the repository using `brew tap`.

    $ brew tap ndimiduk/homebrew-hbase
    ...
    Tapped 3 formula

This repository will now be available in your list and you can install
the recipes directly. For example,

    $ brew install hbase-0.94

Alternately, you can install a recipe directly from a file or via URL:

    $ brew install https://raw.github.com/ndimiduk/homebrew-hbase/master/hbase-0.94.rb

You can do this for each version of HBase you're interested in. Each
installed version gets its own installation directory.

## Caveats

* Just because you've installed multiple versions simultaneously
  doesn't mean you can run them all at the same time. You'll have port
  conflicts and so on. Also be aware that the default `hbase.tmp.dir`
  is not modified by these recipes. That means versions with
  incompatible file formats will conflict. Take care to reconfigure
  the installations as appropriate when switching between versions.

* If you've already installed HBase using homebrew, either from the
  upstream repository or this one, you'll see a linking conflict after
  install. You can only have one HBase version linked to bin/hbase on
  the homebrew path at a time. `brew link` and `brew unlink` are your
  friends.

## See also

[Homebrew][0] for the package manager, [Homebrew-version][2] for the
initial example of an external recipe repository.

[0]: http://mxcl.github.com/homebrew/
[1]: http://hbase.apache.org/
[2]: https://github.com/OpenTSDB/asynchbase
[3]: https://github.com/Homebrew/homebrew-versions
