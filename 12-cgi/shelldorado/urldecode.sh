:
##########################################################################
# Title      :	urldecode - decode URL data
# Author     :	Heiner Steven (heiner.steven@odn.de)
# Date       :	2000-03-15
# Categories :	File Conversion, WWW, CGI
# SCCS-Id.   :	@(#) urldecode	1.4 04/03/03
##########################################################################
# Description
#	Decode data according to
#	    RFC 1738: "Uniform Resource Locators (URL)" and
#	    RFC 1866: "Hypertext Markup Language - 2.0" (HTML)
#	    RFC 2396: "Uniform Resource Identifiers (URI): Generic Syntax"
#
#	This encoding is used i.e. for the MIME type
#	"application/x-www-form-urlencoded"
#
# Notes
#    o	The default behaviour is to decode each line independently of the
#	other, and print the results on an own line. If the line
#	endings are encoded, too (i.e. "%0A" or "%0D%0A"), use the
#	"-l" option to prevent urldecode from adding additional line
#	endings.
#
#    o	Large lines (or binary files) will break many AWK
#    	implementations. If you get the message like
#		awk: record `%3A%0A%23%23%23%23%2...' too long
#	consider using GNU AWK (gawk).
#	If the input line was generated using "urlencode -l", try to
#	omit the "-l" option, if applicable.
#
# See also
#	urlencode
##########################################################################

PN=`basename "$0"`			# Program name
VER='1.4'

: ${AWK:=awk}

Usage () {
    echo >&2 "$PN - decode URL data, $VER
usage: $PN [-l] [file ...]
    -l:  single-line input (line endings are encoded)"
    exit 1
}

Msg () {
    for MsgLine
    do echo "$PN: $MsgLine" >&2
    done
}

Fatal () { Msg "$@"; exit 1; }

set -- `getopt hl "$@" 2>/dev/null` || Usage
[ $# -lt 1 ] && Usage			# "getopt" detected an error

EncodedLF=no
while [ $# -gt 0 ]
do
    case "$1" in
    	-l)	EncodedLF=yes;;
	--)	shift; break;;
	-h)	Usage;;
	-*)	Usage;;
	*)	break;;			# First file name
    esac
    shift
done

$AWK '
    BEGIN {
	hextab ["0"] = 0;	hextab ["8"] = 8;
	hextab ["1"] = 1;	hextab ["9"] = 9;
	hextab ["2"] = 2;	hextab ["A"] = hextab ["a"] = 10
	hextab ["3"] = 3;	hextab ["B"] = hextab ["b"] = 11;
	hextab ["4"] = 4;	hextab ["C"] = hextab ["c"] = 12;
	hextab ["5"] = 5;	hextab ["D"] = hextab ["d"] = 13;
	hextab ["6"] = 6;	hextab ["E"] = hextab ["e"] = 14;
	hextab ["7"] = 7;	hextab ["F"] = hextab ["f"] = 15;
	if ("'"$EncodedLF"'" == "yes") EncodedLF = 1; else EncodedLF = 0
    }
    {
    	decoded = ""
	i   = 1
	len = length ($0)
	while ( i <= len ) {
	    c = substr ($0, i, 1)
	    if ( c == "%" ) {
	    	if ( i+2 <= len ) {
		    c1 = substr ($0, i+1, 1)
		    c2 = substr ($0, i+2, 1)
		    if ( hextab [c1] == "" || hextab [c2] == "" ) {
			print "WARNING: invalid hex encoding: %" c1 c2 | \
				"cat >&2"
		    } else {
		    	code = 0 + hextab [c1] * 16 + hextab [c2] + 0
		    	#print "\ncode=", code
		    	c = sprintf ("%c", code)
			i = i + 2
		    }
		} else {
		    print "WARNING: invalid % encoding: " substr ($0, i, len - i)
		}
	    } else if ( c == "+" ) {	# special handling: "+" means " "
	    	c = " "
	    }
	    decoded = decoded c
	    ++i
	}
	if ( EncodedLF ) {
	    printf "%s", decoded	# no line newline on output
	} else {
	    print decoded
	}
    }
' "$@"
