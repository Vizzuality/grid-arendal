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
if (-e $HEADER) {
  open HEADER;
  while (<HEADER>) {
    print $_;
  }
  close HEADER;

  # The following is customized for Pachamama

  $pacha = $form{'_siteroot'} . "/geo2000/pacha";
  print <<END;
		<table border=0 width=620 cellspacing=0 cellpadding=0>
		 <tr> 
		   <td bgcolor="#ffffff"> 
		     <table  border=0 cellspacing=0 cellpadding=0 bgcolor="#ffffff">
		       <form method="POST" action="search.cgi">
		         <tr align=center valign=middle> 
		           <td height=40 align=right nowrap><font face=arial size=2><b><img src="../images/balls.gif" align=left>Find this:</b></font>&nbsp;</td>
		           <td align=left> 
		             <input type="Text" NAME="search" size="18" maxlength="255">
		             <input type="hidden" name="_db" value="Pachamama">
			          <input type="hidden" name="_siteroot" value="$form{'_siteroot'}">
		             <input type="hidden" name="_searchscript" value="http://www.grida.no/geo2000/pacha/search/search.cgi">
		             <input type="hidden" name="_searchpage" value="search.htm">
						 <input type="hidden" name="_HEADER" value="header">
						 <input type="hidden" name="_FOOTER" value="footer">
		           </td>
		           <td bgcolor="#ffffff">&nbsp; 
		             <input name="search" type=image src="../images/search4.gif" border=0>&nbsp;</td>
		           </tr>
		       </form>
		     </table>
		   </td>
		   <td bgcolor="White" align=right> 
		     <div align="center"> 
		       <table border=0 cellspacing=0 cellpadding=0 valign="bottom" bgcolor="White">
		         <form name="RedirectSearch" target="_top">
		           <tr> 
		             <td> <font face="arial" size="2"><b>Jump:&nbsp;</b></font></td>
		             <td> 
		               <SELECT name="url" onChange="surfto(this.form)">
		                 <option value="" selected> Pick a chapter! 
		                 <option>--------</option>
		                 <OPTION value="$pacha/contents.htm">HOME 
		                 <option>--------</option>
		                 <OPTION value="$pacha/earth.htm">OUR EARTH 
		                 <OPTION value="$pacha/atmos/index.htm"> &nbsp;&nbsp;&#149; Atmosphere 
		                 <OPTION value="$pacha/fresh/index.htm"> &nbsp;&nbsp;&#149; Freshwater 
		                 <OPTION value="$pacha/marine/index.htm"> &nbsp;&nbsp;&#149; Marine &amp; coastal areas 
		                 <OPTION value="$pacha/land/index.htm"> &nbsp;&nbsp;&#149; Land and food 
		                 <OPTION value="$pacha/forests/index.htm"> &nbsp;&nbsp;&#149; Forests 
		                 <OPTION value="$pacha/bio/index.htm"> &nbsp;&nbsp;&#149; Biodiversity 
		                 <OPTION value="$pacha/urban/index.htm"> &nbsp;&nbsp;&#149; Urbanization 
		                 <OPTION value="$pacha/polar/index.htm"> &nbsp;&nbsp;&#149; Polar regions 
		                 <option>--------</option>
		                 <OPTION value="$pacha/future.htm">OUR FUTURE 
		                 <OPTION value="$pacha/future/index.htm"> &nbsp;&nbsp;&#149; Pull the strings 
		                 <OPTION value="$pacha/future/action.htm"> &nbsp;&nbsp;&#149; ...and action! 
		                 <OPTION value="$pacha/future/ruled.htm"> &nbsp;&nbsp;&#149; If we ruled the world... 
		                 <OPTION value="$pacha/future/emerge.htm"> &nbsp;&nbsp;&#149; Emerging issues 
		                 <OPTION value="$pacha/future/science.htm"> &nbsp;&nbsp;&#149; What scientists say 
		                 <OPTION value="$pacha/future/others.htm"> &nbsp;&nbsp;&#149; What others think 
		                 <option>--------</option>
		                 <OPTION value="$pacha/response.htm">WHAT WE CAN DO 
		                 <OPTION value="$pacha/response/index.htm"> &nbsp;&nbsp;&#149; What you can do! 
		                 <OPTION value="$pacha/response/eco.htm"> &nbsp;&nbsp;&#149; Eco times 
		                 <OPTION value="$pacha/response/green.htm"> &nbsp;&nbsp;&#149; How green are you 
		                 <OPTION value="$pacha/response/contrib.htm">&nbsp;&nbsp;&#149; Contributors 
		                 <OPTION value="$pacha/response/glossary.htm">&nbsp;&nbsp;&#149; Glossary 
		                 <OPTION value="$pacha/response/maze.htm"> &nbsp;&nbsp;&#149; EcoMind Maze 
		               </select>
		             </td>
		         </form>
		       </table>
		     </div>
		   </td>
		   <td valign=bottom>
		     <a href=http://www.unep.org><img src="../images/unepsm.gif" width=33 height=38 alt="" border="0"></a>
		   </td>
		 </tr>
		</table>

		<table width=620 border=0 cellpadding=3 cellspacing=0>
			<tr><td bgcolor="#cccc99"><font face=verdana size=1 color="black"><b>&nbsp;search results</b></td></tr>
		</table>

		<p>
		<table border=0 width=620 cellspacing=0 cellpadding=0>
		<tr><td>
		<font face="verdana,arial,sans-serif" size=2>







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
