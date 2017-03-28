#!/www/excite/perl

$root = "/www/excite";
unshift(@INC, "$root/perllib");
require 'architext_query_generic.pl'; # note _generic
require 'ctime.pl';
$aurl = "/adm/excite/";

%form = &ArchitextQuery'readFormArgs;

$db = $form{'_db'}; # the site which we are searching
$siteroot = $form{'_siteroot'}; # the web path to the root of this site
$searchscript = $form{'_searchscript'}; # the web path to this script
$searchpage = $form{'_searchpage'}; # the web path to the search help page
$HEADER = $form{'_HEADER'}; # the header file for the results page
$FOOTER = $form{'_FOOTER'}; # the footer file for the results page

$index = "/www/excite/collections/$db";
$hroot = "/www/web-pub";
$binary = "/www/excite/architextSearch";
$urledit = 's|[\\\/]www[\\\/]web-pub[\\\/]|/|; ';

&ArchitextQuery'directQuery($form{'search'} || '(no search)',
	$form{'mode'} || 'concept', $db, $form{'source'} || 'local', $form{'backlink'} || '*', $form{'bltext'} || '*');
print "Content-type: text/html\n\n";

$form{'root'} = $root;
$search = &ArchitextQuery'setSearchString(%form);
$searchtype = &ArchitextQuery'getSearchMode(%form);

## put necessary additional information into %form
$form{'aurl'} = $aurl;
$form{'db'} = $db;
$form{'index'} = $index;
$form{'hroot'} = $hroot;
$form{'binary'} = $binary;
$form{'urledit'} = $urledit;
$form{'searchpage'} = $ENV{'HTTP_REFERER'} if ($form{'sp'});
$form{'docs'} = '1' unless $form{'docs'};
$form{'psearch'} = $form{'psearch'} || $form{'search'};
$form{'search'} = $search;

# Print header
if (-r $HEADER) {
  open HEADER;
  while (<HEADER>) {
    print $_;
  }
  close HEADER;

  print <<END;
			<FORM ACTION="http://www.grida.no/geo2000/english/search/search.cgi" METHOD=POST>
			<input type="hidden" name="_db" value="GEO_2000">
			<input type="hidden" name="_siteroot" value="$form{'_siteroot'}">
			<input type="hidden" name="_searchscript" value="http://www.grida.no/geo2000/english/search/search.cgi">
			<input type="hidden" name="_searchpage" value="search.htm">
			<input type="hidden" name="_HEADER" value="header">
			<input type="hidden" name="_FOOTER" value="footer">

			<p><INPUT NAME="search" size=30 value="$form{'psearch'}"> <input type=submit value="Search">
		        <br><font size=1><a href="$form{'_siteroot'}/geo2000/english/search.htm">Help and advanced searching</a></font>
			<input type="hidden" name="searchpage" value="http://$form{'_siteroot'}/geo2000/english/search.htm">
			</form>
		<p>
END

} else {
  print "<html><head><title>Search results</title></head>";
  print "<body>";
  print "<h1>Search results</h1>";
}

$errstr = 'success';
## This call checks to make sure that an index has been built for 
## this collection.  Also checks if we should use new query syntax
$form{'newquery'} = &ArchitextQuery'checkForIndex(%form);

print "<p>Searching for ";
if ( $form{'doc'}) {
   print 'documents similar to the previous search';
} else {
   $prettysearch = $search;
   $prettysearch =~ s/\$//g;
   print "<b>$prettysearch</b>";
}    
print "<p>\n";

## Perform the query. This function doesn't print anything. 
##Later commands will display the results.
($errstr, @query_results) = &ArchitextQuery'MakeQuery(%form);
$docs = &ArchitextQuery'PrepareGather(*query_results);
$form{'docs'} = $docs;
&ArchitextQuery'HtmlList(*query_results, %form) if ($errstr eq 'success');

if ($errstr eq 'summary') {
    	&ArchitextQuery'SummaryOutput($form{'stitle'} || '*',
				      $form{'surl'} || '*',
				      *query_results);
} elsif ($errstr eq 'dump') {
    	&ArchitextQuery'DocumentOutput(*query_results);
} else {
    	print &ArchitextQuery'queryError($errstr) 
	    unless ($errstr eq 'success');
}

# Print footer
if (-e $FOOTER) {
  open FOOTER;
  while (<FOOTER>) {
    print $_;
  }
  close FOOTER;
} else {
  print "<hr>";
  print "</body></html>";
}

&ArchitextQuery'footer($aurl) if ($errstr eq 'success');

print "</font></td></tr></table></body></html>\n";
