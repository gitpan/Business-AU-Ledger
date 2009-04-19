use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile
(
 ($] ge '5.005') ?
 (
  AUTHOR   => 'Ron Savage (ron@savage.net.au)',
  ABSTRACT => 'A simple, web-based, payments/receipts manager',
 ) : (),
 clean =>
 {
	 FILES => 'blib/* Makefile MANIFEST Business-AU-Ledger-*'
 },
 dist =>
 {
	 COMPRESS => 'gzip',
	 SUFFIX   => 'gz'
 },
 DISTNAME  => 'Business-AU-Ledger',
 NAME      => 'Business::AU::Ledger',
 PL_FILES  => {},
 PREREQ_PM =>
 {
	 accessors                        => 0,
	 CGI::Session                     => 0,
	 Config::IniFiles                 => 0,
	 DBIx::Admin::CreateTable         => 0,
	 DBIx::Simple                     => 0,
	 Data::FormValidator              => 0,
	 Data::FormValidator::Constraints => 0,
	 Date::Simple                     => 0,
	 FindBin::Real                    => 0,
	 HTML::Template                   => 0,
	 JSON::XS                         => 0,
	 Log::Dispatch                    => 0,
	 Log::Dispatch::DBI               => 0,
	 Regexp::Common                   => 0,
 },
 VERSION_FROM	=> 'lib/Business/AU/Ledger.pm',
);
