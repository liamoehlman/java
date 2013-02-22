name              "java"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs Java runtime."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.9.4"

recipe "java", "Installs Java runtime"
recipe "java::openjdk", "Installs the OpenJDK flavor of Java"
recipe "java::oracle", "Installs the Oracle flavor of Java"
recipe "java::oracle_i386", "Installs the 32-bit jvm without setting it as the default"


%w{ debian ubuntu centos redhat scientific fedora amazon arch oracle freebsd }.each do |os|
  supports os
end

attribute "java/install_flavor",
  :display_name => "Java Install Flavor",
  :description => "Which java to install, openjdk or oracle",
  :required => "recommended",
  :choice => [ "openjdk", "oracle" ],
  :recipes => [
    "java",
    "java::openjdk",
    "java::oracle"
  ]

attribute "java/jdk_version",
  :display_name => "Java Version",
  :description => "Which version of java to install, 6 or 7",
  :required => "recommended",
  :choice => [ "6", "7" ],
  :recipes => [
    "java",
    "java::openjdk",
    "java::oracle"
  ]
