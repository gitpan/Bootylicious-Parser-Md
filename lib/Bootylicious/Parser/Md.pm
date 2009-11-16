package Bootylicious::Parser::Md;

use strict;
use warnings;

use base 'Mojo::Base';

use Text::Markdown;

__PACKAGE__->attr(md => sub { Text::Markdown->new });

our $VERSION = '0.990101';

sub parser_cb {
    my $self = shift;

    return sub {
        my ($head_string, $tail_string) = @_;

        my $head = '';
        my $tail = '';

        $head = $self->md->markdown($head_string);

        if ($tail_string) {
            $tail = $self->md->markdown($tail_string);
        }

        return {
            head => $head,
            tail => $tail
        };
      }
}

1;
__END__

=head1 NAME

Bootylicious::Parser::Md - Markdown parser for bootylicious

=head1 SYNOPSIS

    # Write your articles with .md suffix
    # /articles/20091115-my-markdown-article.md

    Title: Markdown article

    Hello from **Markdown**!

=head1 DESCRIPTION

L<Text::Markdown> parser for your L<bootyliciuos> blog.

=head1 ATTRIBUTES

=head2 C<md>

    Hold Text::Markdown object.

=head1 METHODS

=head2 C<parser_cb>

    Parser callback.

=head1 SEE ALSO

    L<bootylicious>, L<Mojo>, L<Mojolicious>, L<Text::Markdown>

=head1 AUTHOR

Viacheslav Tykhanovskyi, C<vti@cpan.org>.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009, Viacheslav Tykhanovskyi.

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=cut
