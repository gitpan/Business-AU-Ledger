use Module::Build;

my($builder) = Module::Build -> new
(
 module_name    => 'Business::AU::Ledger',
 license        => 'artistic',
 dist_abstract  => 'A simple, web-based, payments/receipts manager',
 dist_author    => 'Ron Savage <ron@savage.net.au>',
 build_requires =>
 {
	 Test::More => 0,
	 Test::Pod  => 0,
 },
 requires =>
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
);

$builder -> add_build_element('conf');
$builder -> create_build_script();

