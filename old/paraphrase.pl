#!/usr/bin/perl -w

use BOSS::Config;
use Capability::Tokenize;
use PerlLib::SwissArmyKnife;
use Sayer;

$Data::Dumper::Deepcopy = 1;

$specification = q(
	-m		Use phrasetable matches
	-s		Skip phrasetable
	-f		Use full phrasetable
);

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;

my $usematches = ! exists $conf->{'-m'};

my $myID;

my $sentences =
  [
   "Seeding of multiple new research directions and projects: projects that will develop new principles and practice of automated theorem proving for higher-order logic, the use of higher-order logic for theorem proving in non-classical logics, and further development of the TPTP THF infrastructure.",
   "Quantiﬁable transfer of knowledge and expertise to Europe: to the host, researchers and students at the host university, and to eleven further institutions in Europe. Further unquantiﬁed development of expertise and knowledge follows from the interaction of the host and researcher with colleagues in Europe and beyond.",
  ];

foreach my $sentence (@$sentences) {
  Paraphrase(Sentence => $sentence);
}

my $phrasetable = {};
if (! exists $conf->{'-s'}) {
  print "Loading phrasetable\n";
  my $fh = IO::File ->new();
  my $fn;
  if (exists $conf->{'-f'}) {
    $fn = "/var/lib/myfrdcsa/datasets/terp/terp-pt.v1/unfiltered_phrasetable.txt";
  } else {
    $fn = "/var/lib/myfrdcsa/datasets/terp/terp-pt.v1/unfiltered_phrasetable.10000.txt";
  }
  print "Opening $fn\n";
  $fh->open("<$fn") or die "cannot open phrasetable $fn\n";

  print "Populating phrasetable\n";
  while (<$fh>) {
    if ($_ =~ /^([\d\.])+ <p>(.+?)<\/p> <p>(.+?)<\/p>$/) {
      $phrasetable->{$2}{$3} = $1;
    } else {
      print "Hey! <$_>\n";
    }
  }

  print "Done loading phrasetable!\n";
}


sub GetAllWindowsForSentence {
  my %args = @_;
  my $s = $args{Sentence};
  my $t = tokenize_treebank($s);
  my @tokens = split /\s+/, $t;

  my @windows = @{GetAllWindows(Tokens => \@tokens)};
  # print "There are a total of ".scalar @windows." windows\n";
  # print Dumper(\@windows);
  return \@windows;
}

sub Paraphrase {
  my %args = @_;
  GetAllWindowsForSentence(Sentence => $args{Sentence})
  my @windows = @{;
  foreach my $w1 (@windows) {
    foreach my $w2 (@windows) {
      if ($w1->{ID} < $w2->{ID}) {
	my $mutex = IsMutexP
	  (
	   W1 => $w1,
	   W2 => $w2,
	  );
	if (! $mutex) {
	  
	} else {
	  print "MUTEX: ";
	}
	print $w1->{ID} ."-". $w2->{ID}."\n";
      }
    }
  }
  # now take this information and generate
}

sub IsMutexP {
  my %args = @_;
  my $mutex = 0;
  foreach my $l (keys %{$args{W1}->{Lock}}) {
    if (exists $args{W2}->{Lock}{$l}) {
      $mutex = 1;
      last;
    }
  }
  return $mutex;
}

sub GetAllWindows {
  my %args = @_;
  $myID = 1;
  my $t = $args{Tokens};
  my $length = scalar @$t;
  my @windows;
  foreach my $n (2 .. $length) {
    my $res = GetWindowsOfSizeN
      (
       Tokens => $t,
       N => $n,
      );
    push @windows, @{$res->{Results}};
  }
  return \@windows;
}

sub GetWindowsOfSizeN {
  my %args = @_;
  my $n = $args{N};
  my @prefix;
  my @window;
  my @postfix = @{$args{Tokens}};
  my @results;
  while (@postfix) {
    push @window, shift @postfix;
    if ($n == scalar @window) {
      if (exists $phrasetable->{join(" ",@window)}) {
	my $prefixsize = scalar @prefix;
	my $lock = {};
	for (my $i = $prefixsize + 1; $i < $prefixsize + 1 + $n; ++$i) {
	  $lock->{$i} = 1;
	}
	push @results, {
			Breakdown => [[@prefix],[@window],[@postfix]],
			Lock => $lock,
			ID => $myID++,
		       };
      }
      # print join("-",@prefix)." :: ".join("-",@window)." :: ".join("-",@postfix)."\n";
      push @prefix, shift @window;
    }
  }
  return {
	  Results => \@results,
	 };
}

# tests

my @tokens = ( 'Seeding', 'of', 'multiple', 'new', 'research',
	       'directions', 'and', 'projects', ':', 'projects', 'that',
	       'will', 'develop', 'new', 'principles', 'and', 'practice',
	       'of', 'automated', 'theorem', 'proving', 'for',
	       'higher-order', 'logic', ',', 'the', 'use', 'of',
	       'higher-order', 'logic', 'for', 'theorem', 'proving', 'in',
	       'non-classical', 'logics', ',', 'and', 'further',
	       'development', 'of', 'the', 'TPTP', 'THF', 'infrastructure',
	       '.'  );
# print Dumper
#   (GetWindowsOfSizeN
#    (
#     N => 2,
#     Tokens => \@tokens,
#    ));
