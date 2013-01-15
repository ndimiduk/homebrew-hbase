require 'formula'

class Hbase094 < Formula
  url 'http://www.apache.org/dyn/closer.cgi?path=hbase/hbase-0.94.4/hbase-0.94.4.tar.gz'
  homepage 'http://hbase.apache.org'
  md5 '65db1485f85ebfc94144a24f27ca0d15'

  depends_on 'hadoop'

  def shim_script target
    <<-EOS.undent
      #!/bin/bash
      exec "#{libexec}/bin/#{target}" "$@"
    EOS
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin conf docs lib hbase-webapps]
    libexec.install Dir['*.jar']
    bin.mkpath
    Dir["#{libexec}/bin/*"].each do |b|
      n = Pathname.new(b).basename
      (bin+n).write shim_script(n)
    end

    inreplace "#{libexec}/conf/hbase-env.sh",
      "# export JAVA_HOME=/usr/java/jdk1.6.0/",
      "export JAVA_HOME=\"$(/usr/libexec/java_home)\""
  end

  def caveats; <<-EOS.undent
    Requires Java 1.6.0 or greater.

    You must also edit the configs in:
      #{libexec}/conf
    to reflect your environment. If you're using multiple hbase versions,
    be sure to give each its own hbase.rootdir and hbase.tmp.dir to avoid
    conflicts in persisted data.

    For more details:
      http://wiki.apache.org/hadoop/Hbase
    EOS
  end
end
