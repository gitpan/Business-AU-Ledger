package Business::AU::Ledger::Database::Base;

use Moose;

has db     => (is => 'rw', isa => 'Business::AU::Ledger::Database');
has simple => (is => 'rw', isa => 'DBIx::Simple');

our $VERSION = '0.82';

# -----------------------------------------------

sub log
{
	my($self, $s) = @_;

	$self -> db() -> log($s);

}	# End of log.

# --------------------------------------------------

no Moose;

1;
