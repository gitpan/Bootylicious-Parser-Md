#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

use Bootylicious::Parser::Md;

my $md = Bootylicious::Parser::Md->new;

my $head =<<'';
**Markdown**

my $tail =<<'';
*is cool*.

my $output = $md->parser_cb->($head, $tail);
is($output->{head}, "<p><strong>Markdown</strong></p>\n");
is($output->{tail}, "<p><em>is cool</em>.</p>\n");
