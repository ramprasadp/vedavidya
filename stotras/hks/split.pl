#!/usr/bin/perl
my $i=0;
use IO::File;
my $fh=reopen(\$i);
while(<>){
    if(/sandhi\<(\d+)/){
	$fh=reopen(\$i,\$fh) if($1 > 1);
    }
    print $fh $_;
}
close $fh;




sub reopen { 
    my($iref,$f)=@_;
    if($f){ 
	close $$f;
    }
    $$iref = $$iref+1;
    my $file = sprintf("hkmsara_%02d.brh",$$iref);
    print "Opening file $file\n";
    my $fh = IO::File->new(">$file");
    return $fh;
}

