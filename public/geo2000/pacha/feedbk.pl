#!/usr/bin/perl 
######################
# Configurable options
######################

## Script converted to using Mail::Sendmail in April 2003 by Brian.

use Mail::Sendmail;

# Where is this mail going?
# (May be overridden by the "to" field on the submitted form)
$destaddr = "Pachamama\@unep.org";

# whether or not to actually allow mail to be sent -- for testing purposes
$active = 1;

# Logging flag.  Logs on POST method when mail is sent.
# $logging = 1;
# $logfile = '/usr/www/admin/logs/mailto_log';

# Physical script location.  Define ONLY if you wish to make your version
# of this source code available with GET method and the suffix '?source'
# on the url.
# $script_loc = '/usr/www/cgi-bin/sendmail.pl';

# physical location of your cgi-lib.pl
$cgi_lib = '/www/cgi-bin/cgi-lib.pl';

# http script location
$script_http = 'http://www.grida.no/pub/geo2000/feedbk.pl';

## The definitions for sendmail below were eliminated by Brian when the script
## was converted to using Mail::Sendmail instead, in April 2003.

# Path to sendmail and its flags.  Use the first commented version and
# define $listserver = 1if you want the gateway to be used for listserver
# subscriptions -- the -f switch might be neccesary to get this to work
# correctly.
#
# sendmail options:
#    -n  no aliasing
#    -t  read message for "To:"
#    -oi don't terminate message on line containing '.' alone
# $sendmail = "/usr/lib/sendmail -t -n -oi -f";  $listserver = 1;
# $sendmail = "/usr/lib/sendmail -t -n -oi";

# set to 1 if you want the real addresses to be exposed from %addrs
# $expose_address = 1;

# Uncomment one of the below chunks of code to implement restricted mail

# version
$version = '2.2';

#############################
# end of configurable options
#############################

require $cgi_lib;
&ReadParse();

#########################################################################
# Method POST implies that they already filled out the form and submitted
# it, and now it is to be processed.
#########################################################################

if ($ENV{'REQUEST_METHOD'} eq 'POST') {

    # get all the variables in their respective places
    $destaddr = $in{'to'};
    $cc       = $in{'cc'};
    $fromaddr = $in{'from'};
    $fromname = $in{'name'};
    $replyto  = $in{'from'};
    $sender   = $in{'from'};
    $errorsto = $in{'from'};
    $subject  = $in{'sub'};
    $body     = $in{'body'};
    $nexturl  = $in{'nexturl'};
    $realfrom = $ENV{'REMOTE_HOST'} ? $ENV{'REMOTE_HOST'}: $ENV{'REMOTE_ADDR'};

    # check to see if required inputs were filled - error if not
    unless ($body) {
    # Removed the requirement for a "from" address: && fromaddr && ($fromaddr =~ /^.+\@.+/)) {
    	print &PrintHeader();
		print <<EOH;
Content-type: text/html
Status: 400 Bad Request

<HTML><HEAD><TITLE>Feedback form error</TITLE></HEAD>
<BODY><H1>Feedback form error</H1>
<P>The following necessary information was missing
from your mail submission:
<UL>
EOH

		#unless ($fromaddr) { print "<LI><B>Your Email</B>: your full email address</LI>"; }
		unless ($body) { print "<LI><B>Your message</B>: the text you wish to send</LI>"; }

		print <<EOH;
</UL>
Please click the "back" button on your web browser, fill in the missing information, and try again!</P></BODY></HTML>
EOH
    	exit(0);
    } # end unless... check for required fields

    # do some quick logging - you may opt to have more/different info written
    if ($logging) {
        open(MAILLOG,">>$logfile");
        print MAILLOG "$realfrom\n";
        close(MAILLOG);
    } # end if... logging

    # Log every CGI variable except for the ones reserved for mail info.
    # Valid vars go into @data.  Text output goes into $data and gets.
    # appended to the end of the mail.
    # First, get an ORDERED list of all cgi vars from @in to @keys
    for (0 .. $#in) {
        local($key) = split(/=/,$in[$_],2);
        $key =~ s/\+/ /g;
        $key =~ s/%(..)/pack("c",hex($1))/ge;
        push(@keys,$key);
    }
    # Now weed out the ones we want
    @reserved = ('to', 'cc', 'from', 'name', 'sub', 'body', 'nexturl');
    local(%mark);
    foreach (@reserved) { $mark{$_} = 1; }
    @data = grep(!$mark{$_}, @keys);
    foreach (@data) {
        $data .= "$_ -> $in{$_}\n";
    }

    # Convert multiple bodies (separated by \0 according to CGI spec)
    # into one big body
    $body =~ s/\0//;

    # fork over the mail to sendmail and be done with it
    if ($active) {
		my %mail = (
			To => $destaddr,
			From => $fromaddr,
			Subject => $subject,
			Message => $body
		);
		sendmail(%mail) || print "Error sending mail: $Mail::Sendmail::error\n";
    } # end if... $active

    # give some short confirmation results
    #
    # if the cgi var 'nexturl' is given, give out the location, and let
    # the browser do the work.
    if ($nexturl) {
        print "Location: $nexturl\n\n";
    }
    # otherwise, give them the standard form.
    else {
        print &PrintHeader();
        print <<EOH;
<HTML><HEAD><TITLE>Results</TITLE></HEAD>
<BODY><H1>Results</H1>
<P>Mail sent to <B>$destaddr</B>:<BR><BR></P>
<PRE>
<B>Subject</B>: $subject
<B>From</B>: $fromname &lt;$fromaddr>

$body</PRE>
<HR>
<A HREF="$script_http">Back to the Feedback form</A>
</BODY></HTML>
EOH

	exit(0);
	} # end if... $nexturl

} else {
	print &PrintHeader();
    print <<EOH;
<HTML><HEAD><TITLE>Feedback form error</TITLE></HEAD>
<BODY><H1>Feedback form error</H1>
<P>There is an error in the feedback form.  A method of POST is required.
Please contact <a href="mailto:$destaddr">$destaddr</a> 
to report this problem.
</P></BODY></HTML>
EOH
	exit 1;
}



#
# Deal out error messages to the user.  Gets passed a string containing
# a description of the error
#
sub InternalError {
    local($errmsg) = @_;

    print &PrintHeader();
    print <<EOH;
Content-type: text/html
Status: 502 Bad Gateway

<HTML><HEAD><TITLE>Feedback form Internal Error</TITLE></HEAD>
<BODY><H1>Mailto Gateway Internal Error</H1>
<P>Your mail failed to send for the following reason:<BR><BR>
<B>$errmesg</B></P></BODY></HTML>
EOH
    exit(0);
}


##
## end of mailto.pl
##
