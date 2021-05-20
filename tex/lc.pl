$name=$ARGV[0];  # 'ecology';
# $name='ecology';
$file1n="$name.bib";
$file2n="$name.bib.tmp";
system("cp $file1n $file1n.save");

open(file1,"$file1n");
open(file2,">$file2n");
$titleLast=0;
$isbook=0;
while($line=<file1>){
    if($line=~/^\s{0,}(Title|title)/ | $titleLast){
        if($line=~/^\s{0,}(Title|title)/ | $line!~/=/){
            $line =~ s/(\s+\w{2,})/\L$1/xg;
            $line =~ s/-(\w{2,})/-\L$1/xg;
            #    if($line=~ s/(\s\w{2,})/){  #here
            #        print "yes\n";
            #    }
            if($line!~/=/){
                $line =~ s/(^\s{0,}\w)/\L$1/xg;
            }
#            $line =~ s/\{(\w)/\{\U$1/xg;
            $line =~ s/\{\s+(\w)/\{\U$1/xg;
            $line =~ s/\s{0,}(^title)/Title/xg; 
            $titleLast=1;
        }
        else {
            $titleLast=0;
        }
    }
    print file2 "$line";
}
close(file1);
close(file2);

$file1n="$name.bib.tmp";
$file2n="$name.bib.tmp2";
open(file1,"$file1n");
open(file2,">$file2n");
$titleLast=0;
while($line=<file1>){
    if($line=~/^\s{0,}(Booktitle|booktitle)/ | $titleLast){
        if($line=~/^\s{0,}(Booktitle|booktitle)/ | $line!~/=/){
            $line =~ s/((^\w)|(\s+\w)|(\n\w))/\U$1/xg;
#        $line =~ s/([\w\']+)/\u\L$1/g;  
            # $line=uc($line);
            
            $line =~ s/((A|An|Nor|Or|And|To|With|Of|The|In|For|But|On|By|At|Down|From|Into|Like|Off|Onto|Out|Over|Up|Upon)\s)/\L$1/xg;  
            #       $line =~ s/((A|An|Nor|Or|And|To|With|Of|The|In|For|But|On|By|At|Down|From|Into|Like|Off|Onto|Out|Over|Up|Upon)\})/\L$1/g;  
            $line =~ s/(:\s+\w)/\U$1/xg; 
            $titleLast=1;
        }
        else {
            $titleLast=0;
        }
    }
    print file2 "$line";
}
close(file1);
close(file2);

$file1n="$name.bib.tmp2";
$file2n="$name.bib";
open(file1,"$file1n");
open(file2,">$file2n");
$titleLast=0;
while($line=<file1>){
    if($line=~/\@/){
        if($line=~/ook/){
            $isbook=1;
        }
        else {
            $isbook=0;
        }
    }
    if($isbook){
        if($line=~/(Title|title)/ | $titleLast){
            if($line=~/(Title|title)/ | $line!~/=/){
                $line =~ s/((^\w)|(\s+\w)|(\n\w))/\U$1/xg;
#        $line =~ s/([\w\']+)/\u\L$1/g;  
                # $line=uc($line);
                
                $line =~ s/((A|An|Nor|Or|And|To|With|Of|The|In|For|But|On|By|At|Down|From|Into|Like|Off|Onto|Out|Over|Up|Upon)\s)/\L$1/xg;  
                #       $line =~ s/((A|An|Nor|Or|And|To|With|Of|The|In|For|But|On|By|At|Down|From|Into|Like|Off|Onto|Out|Over|Up|Upon)\})/\L$1/g;  
                $line =~ s/(=\s{0,}\{\w)/\U$1/xg;
                $line =~ s/(:\s+\w)/\U$1/xg; 
                $titleLast=1;
            }
            else {
                $titleLast=0;
            }
        }
    }
    print file2 "$line";
}
close(file1);
close(file2);
$file1n="$name.bib.tmp2";

system("rm $name.bib.tmp");
system("rm $name.bib.tmp2");
