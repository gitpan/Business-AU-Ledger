#!/usr/bin/perl
#
# Name:
# ledger.cgi.
#
# Note:
# Need use lib here because CGI scripts don't have access to
# the PerlSwitches used in httpd.conf.
# Also, it saves having to install the module repeatedly during testing.

use lib '/home/ron/perl.modules/Business-AU-Ledger/lib';
use strict;
use warnings;

use Business::AU::Ledger;

# ----------------

Business::AU::Ledger -> new() -> run();
