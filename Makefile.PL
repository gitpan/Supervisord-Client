
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "a perl client for Supervisord's XMLRPC.",
  "AUTHOR" => "Samuel Kaufman <samuel.c.kaufman\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Supervisord-Client",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Supervisord::Client",
  "PREREQ_PM" => {
    "Config::INI::Reader" => 0,
    "LWP::Protocol::http::SocketUnixAlt" => 0,
    "Moo::Lax" => 0,
    "RPC::XML::Client" => 0,
    "Safe::Isa" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.1_01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Config::INI::Reader" => 0,
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "LWP::Protocol::http::SocketUnixAlt" => 0,
  "Moo::Lax" => 0,
  "RPC::XML::Client" => 0,
  "Safe::Isa" => 0,
  "Test::More" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



