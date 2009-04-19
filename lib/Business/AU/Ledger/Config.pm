package Business::AU::Ledger::Config;

use Carp;

use Config::IniFiles;

use Moose;

has config  => (is => 'rw', isa => 'Config::IniFiles');
has section => (is => 'rw', isa => 'Str');

our $VERSION = '0.82';

# -----------------------------------------------

sub BUILD
{
	my($self) = @_;
	my($name) = '.htledger.conf';

	my($path);

	for (keys %INC)
	{
		next if ($_ !~ m|Business/AU/Ledger/Config.pm|);

		($path = $INC{$_}) =~ s/Config.pm/$name/;
	}

	# Check [global].

	$self -> config(Config::IniFiles -> new(-file => $path) );
	$self -> section('global');

	if (! $self -> config() -> SectionExists($self -> section() ) )
	{
		Carp::croak "Config file '$path' does not contain the section [" . $self -> section() . ']';
	}

	# Check [x] where x is host=x within [global].

	$self -> section($self -> config() -> val($self -> section(), 'host') );

	if (! $self -> config() -> SectionExists($self -> section() ) )
	{
		Carp::croak "Config file '$path' does not contain the section [" . $self -> section() . ']';
	}

} # End of BUILD.

# -----------------------------------------------

sub get_autocommit
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'AutoCommit');

} # End of get_autocommit.

# -----------------------------------------------

sub get_css_url
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'css_url');

} # End of get_css_url.

# -----------------------------------------------

sub get_database
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'database');

} # End of get_database.

# -----------------------------------------------

sub get_dsn
{
	my($self) = @_;

	my(%option);

	$option{'autocommit'}     = $self -> get_autocommit();
	$option{'database'}       = $self -> get_database();
	$option{'session_driver'} = $self -> get_session_driver();
	$option{'password'}       = $self -> get_password();
	$option{'raiseerror'}     = $self -> get_raiseerror();
	$option{'username'}       = $self -> get_username();

	if ($option{'session_driver'} eq 'driver:postgresql')
	{
		my($dsn) = "dbi:Pg:dbname=$option{'database'}";

		return [$dsn, $option{'username'}, $option{'password'},
				{
					AutoCommit => $option{'autocommit'},
					RaiseError => $option{'raiseerror'},
				}];
	}
	else
	{
		die __PACKAGE__ . '. Code to construct DSN needs work';
	}

} # End of get_dsn.

# -----------------------------------------------

sub get_form_action
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'form_action');

} # End of get_form_action.

# -----------------------------------------------

sub get_host
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'host');

} # End of get_host.

# -----------------------------------------------

sub get_password
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'password');

} # End of get_password.

# -----------------------------------------------

sub get_raiseerror
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'RaiseError');

} # End of get_raiseerror.

# -----------------------------------------------

sub get_session_driver
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'session_driver');

} # End of get_session_driver.

# -----------------------------------------------

sub get_session_table_name
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'session_table_name');

} # End of get_session_table_name.

# -----------------------------------------------

sub get_start_month
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'start_month');

} # End of get_start_month.

# -----------------------------------------------

sub get_tmpl_path
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'tmpl_path');

} # End of get_tmpl_path.

# -----------------------------------------------

sub get_username
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'username');

} # End of get_username.

# -----------------------------------------------

sub get_yui_url
{
	my($self) = @_;

	return $self -> config() -> val($self -> section(), 'yui_url');

} # End of get_yui_url.

# --------------------------------------------------

no Moose;

1;

=head1 NAME

C<Business::AU::Ledger::Config> - A helper for Business::AU::Ledger

=head1 Synopsis

	See docs for Business::AU::Ledger.

=head1 Description

C<Business::AU::Ledger::Config> is a pure Perl module.

It reads lib/Business/AU/Ledger/.htledger.conf.

=head1 Constructor and initialization

Auto-generated code will create objects of type C<Business::AU::Ledger::Config>. You don't need to.

=head1 Author

C<Business::AU::Ledger> was written by Ron Savage I<E<lt>ron@savage.net.auE<gt>> in 2009.

Home page: http://savage.net.au/index.html

=head1 Copyright

Australian copyright (c) 2008, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	the Artistic or the GPL licences, copies of which is available at:
	http://www.opensource.org/licenses/index.html

=cut
