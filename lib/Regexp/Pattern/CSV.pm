package Regexp::Pattern::CSV;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %RE;

$RE{get_field_comma_noquote_noesc} = {
    summary => 'Capture fields from row string '.
        '(field separator is comma, no quote handling, no escape handling)',
    description => <<'_',

You use it in Perl like this:

    my $re = re('get_field_comma_noquote_noesc');
    my @fields;
    while ($chomped_row =~ /$re/g) { push @fields, $1 }

Since this regex does not handle quoting or escaping, basically the above is a
longer variant of:

    my @fields = split /,/, $chomped_row;

_
    pat => qr{

(?(DEFINE)


)

    }x,
    tags => ['capturing'],
};

$RE{get_field_comma_quote_noesc} = {
    summary => 'Capture fields from row string '.
        '(field separator is comma, quote character is ", no escape handling)',
    description => <<'_',

You use it in Perl like this:

    my $re = re('get_field_comma_quote_noesc');
    my @fields;
    while ($chomped_row =~ /$re/g) { push @fields, $2 }

To check whether field is quoted, check `$1` which will contain `"` if field is
quoted.

_
    pat => qr{(?:\A|,)("?)([^,]*)\1}x,
    tags => ['capturing'],
};

1;
# ABSTRACT: Regexp patterns to match and parse CSV

=head1 SEE ALSO

L<Text::CSV> and L<Text::CSV_XS>

L<Text::ParseWords>

L<Regexp::Pattern>
