#!/usr/bin/perl
#
# Title : Random Content Hider
# Version : 1.0
# Author : Nigel Peck, MIS Web Design
# URL : http://www.miswebdesign.com/
# Email : nigel@miswebdesign.com # Status : Release
# Created : 24th October 2003
# Copyright : 2008, Nigel Peck, MIS Web Design
# Rights : Feel free to change/borrow/steal whatever you like from this script as
# long as you take out all of this top section of comments first. I don't
# want the blame for your changes.
#
# If you have any problems while using this script feel free to contact me and I may do
# my best to help. I do not provide any warranty for the use of this script, you use it
# at your own risk and your own responsibility. No camels were harmed during the # production of this script.
#

use CGI;

my $q=new CGI;
my $total = $q->param("t");
my $prefix = $q->param("p");
my $debug = $q->param("debug");

# If you want to apply something other than display:none, just change this line
my $css = '{display:none;}';
error ("You must supply a numric value greater than zero to t (total)") unless (($total =~ /^\d+$/) && ($total > 0));
error ("You must supply a prefix value to p (prefix)") unless $prefix;

my $num = int(rand($total)) + 1; print "Cache-Control: no-cache\n";

print "Expires: Thu, 01 Dec 1994 16:00:00 GMT\n";

print (($debug == 1) ? ("Content-type: text/plain\n\n") : ("Content-type: text/css\n\n"));

for (my $i=1; $i <= $total; $i++) { unless ($i==$num) { print '#' . $prefix . $i . ' ' . $css . "\n" } } sub error ($) { print "Content-type: text/html\n\n"; print 'Error'; print '' . $_[0] . ''; print ''; die; }