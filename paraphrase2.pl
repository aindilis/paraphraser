#!/usr/bin/perl -w

use BOSS::Config;
use Capability::Tokenize;
use PerlLib::SwissArmyKnife;
use Sayer;

use List::Compare;
use List::PowerSet qw(powerset powerset_lazy);


$Data::Dumper::Deepcopy = 1;

$specification = q(
	-f		Use full phrasetable
	-o		Overwrite cache for this entry

	-m <num>	Minimum number of substitutions
	-p <prob>	Cutoff probability

	-l <num>	Limit to this number of entries maximum

	-v		Verbose

	--no-parens	Skip including parenthesis around changes

	-w		Don't weigh by number of changes * probability

	-i		Interactive

	--perm <num>	Number of perms before giving up

);

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;

die "Not yet implemented\n" if (exists $conf->{'-w'});

my $verbose = exists $conf->{'-v'};
my $minimumchanges = $conf->{'-m'} || 0;
my $maximumentries = $conf->{'-l'} || 1000;
my $noparens = exists $conf->{'--no-parens'};

my $myID;
my $phrasetable = {};
my $sayer = Sayer->new(DBName => "sayer_paraphraser");
# $sayer->ClearCache();

my $codes =
  {
   Paraphraser => sub {
     return GetAllWindowsForSentence(Sentence => $_[0]->{Sentence})
   },
  };


if ($conf->{'-i'}) {
  print "\n?: ";
  while (my $sentence = <STDIN>) {
    Paraphrase
      (
       Sentence => $sentence,
      );
    print "\n?: ";
  }
} else {
  my $sentences =
    [
     "I love working with cats.",
     # "Seeding of multiple new research directions and projects: projects that will develop new principles and practice of automated theorem proving for higher-order logic, the use of higher-order logic for theorem proving in non-classical logics, and further development of the TPTP THF infrastructure.",
     # "Quantiﬁable transfer of knowledge and expertise to Europe: to the host, researchers and students at the host university, and to eleven further institutions in Europe. Further unquantiﬁed development of expertise and knowledge follows from the interaction of the host and researcher with colleagues in Europe and beyond.",
    ];
  foreach my $sentence (@$sentences) {
    Paraphrase
      (
       Sentence => $sentence,
      );
  }
}



sub LoadPhraseTable {
  if (! scalar keys %$phrasetable) {
    PrintMessage("Loading phrasetable\n");
    my $fh = IO::File ->new();
    my $fn;
    if (exists $conf->{'-f'}) {
      $fn = "/media/usb0/temp/myfrdcsa/datasets/terp/terp-pt.v1/unfiltered_phrasetable.txt";
    } else {
      $fn = "/var/lib/myfrdcsa/datasets/terp/terp-pt.v1/unfiltered_phrasetable.10000.txt";
    }
    PrintMessage("Opening $fn\n");
    $fh->open("<$fn") or die "cannot open phrasetable $fn\n";

    PrintMessage("Populating phrasetable\n");
    while (<$fh>) {
      if ($_ =~ /^([\d\.]+) <p>(.+?)<\/p> <p>(.+?)<\/p>$/) {
	$phrasetable->{$2}{$3} = $1;
      } else {
	PrintMessage("Hey! <$_>\n");
      }
    }

    PrintMessage("Done loading phrasetable!\n");
  } else {
    PrintMessage("Phrasetable already loaded\n");
  }
}

sub GetAllWindowsForSentence {
  my %args = @_;
  my $s = $args{Sentence};
  my $t = tokenize_treebank($s);
  my @tokens = split /\s+/, $t;
  print Dumper(\@tokens);

  my @windows = @{GetAllWindows(Tokens => \@tokens)};
  # PrintMessage("There are a total of ".scalar @windows." windows\n");
  # PrintMessage(Dumper(\@windows));
  return \@windows;
}

sub Paraphrase {
  my %args = @_;

  PrintMessage("Sentence: " .$args{Sentence}."\n");

  my $res = $sayer->ExecuteCodeOnData
    (
     GiveHasResult => 1,
     CodeRef => $codes->{"Paraphraser"},
     Data => [{
	       Sentence => $args{Sentence},
	      }],
    );
  if (! $res->{Success}) {
    my $resneg1 = $sayer->ExecuteCodeOnData
      (
       CodeRef => $codes->{"Paraphraser"},
       Data => [{
		 Sentence => $args{Sentence},
		}],
      );
    $res = $sayer->ExecuteCodeOnData
      (
       GiveHasResult => 1,
       CodeRef => $codes->{"Paraphraser"},
       Data => [{
		 Sentence => $args{Sentence},
		}],
      );
  }

  PrintMessage(Dumper({Res => $res}));

  if ($res->{Success}) {
    my $mutex = {};
    my @windows = @{$res->{Result}->[0]};
    foreach my $w1 (@windows) {
      foreach my $w2 (@windows) {
	if ($w1->{ID} < $w2->{ID}) {
	  if (IsMutexP
	      (
	       W1 => $w1,
	       W2 => $w2,
	      )) {
	    $mutex->{$w1->{ID}}{$w2->{ID}} = 1;
	    $mutex->{$w2->{ID}}{$w1->{ID}} = 1;
	  } else {
	    PrintMessage($w1->{ID} ."-". $w2->{ID}."\n");
	  }
	}
      }
    }
    PrintMessage(Dumper($mutex));

    my $res2 = GenerateAllPerms
      (
       Count => scalar @windows,
       Mutex => $mutex,
       Data => [[0],[1]],
      );

    my $permcount = scalar @{$res2->{Result}};
    if ($permcount < ($conf->{'--perm'} || 5000)) {

      # PrintMessage(Dumper({Res2 => $res2->{Result}}));
      my $prototypes = GetAllPrototypes
	(
	 Perms => $res2->{Result},
	 Input => $res->{Result}->[0],
	);
      # PrintMessage(Dumper({Prototypes => $prototypes}));
      my $count;
      foreach my $prototype (sort {$b->{Score} <=> $a->{Score}} @$prototypes) {
	my $res3 = PrettyPrint(Prototype => $prototype, Input => $res->{Result}->[0]);
	if ($res3->{Success}) {
	  print PrintScore(Prototype => $prototype)."\t".join(" ",@{$res3->{Result}})."\n";
	  $count++;
	}
	last if ($count > $maximumentries);
      }

      # now take this information and generate the powerset of the set
      # of windows, minus all sets of windows that have mutex windows in
      # them

      # my $numwindows = scalar @windows;
      # my $ps_iterator = powerset_lazy(1 .. $numwindows);
      # my @nonmutexsetofwindows;
      # my $k = 0;
      # while(my $set = $ps_iterator->()) {
      #   if (! ContainsMutex(Set => $set)) {
      # 	push @nonmutexsetofwindows, $set;
      #   } else {
      # 	PrintMessage(Dumper);
      # 	  ({
      # 	    ContainsMutex => $set,
      # 	   });
      #   }
      #   if (!($k % 10000)) {
      # 	PrintMessage($k."\n");
      #   }
      #   ++$k;
      # }
    } else {
      PrintMessage("Permutations exceeds limit, skipping\n");
    }
  }
}

sub ContainsMutex {
  my %args = @_;
  foreach my $id (@{$args{Set}}) {
    $seen->{$id} = 1;
    foreach my $mutexid (keys %{$mutex->{$id}}) {
      if ($seen->{$mutexid}) {
	return 1;
      }
    }
  }
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
  LoadPhraseTable();
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
			Probability => $phrasetable->{join(" ",@window)},
		       };
      }
      # PrintMessage(join("-",@prefix)." :: ".join("-",@window)." :: ".join("-",@postfix)."\n");
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
# PrintMessage(Dumper);
#   (GetWindowsOfSizeN
#    (
#     N => 2,
#     Tokens => \@tokens,
#    ));

sub GenerateAllPerms {
  my %args = @_;
  # $args{Count};
  my $m = $args{Mutex};
  my $d = $args{Data};
  my $depth = scalar @{$d->[0]};
  if (! $args{Count} or $depth == $args{Count}) {
    return
      {
       Result => $d,
       Success => 1,
      };
  }
  PrintMessage("$depth/".$args{Count}."\n");

  my @data;
  foreach my $seq (@$d) {
    # PrintMessage(join("",@$seq)."\n");
    my $isMutex = 0;
    foreach my $imutex (keys %{$m->{$depth}}) {
      if ($imutex < $depth) {
	if ($seq->[$imutex - 1]) {
	  $isMutex = 1;
	}
      }
    }

    if (! $isMutex) {
      push @data, [@$seq, 1];
    }
    push @data, [@$seq, 0];
  }

  my $res = GenerateAllPerms
    (
     Count => $args{Count},
     Mutex => $m,
     Data => \@data,
    );
  return
    {
     Result => $res->{Result},
     Success => 1,
    };
}

sub GetAllPrototypes {
  my %args = @_;
  # PrintMessage(Dumper({Input => $args{Input}}));
  my @prototypes;
  my $i = 0;
  my $permcount = scalar @{$args{Perms}};
  foreach my $perm (@{$args{Perms}}) {
    push @prototypes,
      @{GetAllPrototypesOfPerm
	  (
	   Depth => 0,
	   Perm => $perm,
	   Prototypes => [{Prototype => [], Probability => 1.0}],
	   Input => $args{Input},
	  )};
    my $prototyperunningcount = scalar @prototypes;
    PrintMessage("[".($i+1)."/$permcount] $prototyperunningcount\n");
    ++$i;
  }
  foreach my $prototype (@prototypes) {
    $prototype->{Score} = Score(Prototype => $prototype);
  }
  return \@prototypes;
}

sub GetAllPrototypesOfPerm {
  my %args = @_;
  my $depth = $args{Depth};
  PrintMessage(Dumper);
  ({
    InDepth => $depth,
    Prototypes => scalar @{$args{Prototypes}},
    SamplePrototype => $args{Prototypes}->[0],
    Perm => $args{Perm},
   }) if 0;

  if ($depth == scalar @{$args{Perm}}) {
    return $args{Prototypes};
  }

  my @newprototypes;
  my @longkeys = sort {$args{Input}->[$depth]->{Probability}->{$b} <=> $args{Input}->[$depth]->{Probability}->{$a}} keys %{$args{Input}->[$depth]->{Probability}};
  my @keys = splice @longkeys, 0, 3;
  # PrintMessage(Dumper({Keys => \@keys}));
  foreach my $prototype (@{$args{Prototypes}}) {
    if ($args{Perm}->[$depth] and scalar @keys) {
      # need to substitute all different items in here
      foreach my $substitution (@keys) {
	# PrintMessage(Dumper({Substitution => $substitution}));
	# my @tokens = split /\s+/, $substitution;
	my @newprototype = [@{$prototype->{Prototype}},$depth,$substitution];
	push @newprototypes, {
			      Prototype => @newprototype,
			      Probability => $prototype->{Probability} * $args{Input}->[$depth]->{Probability}->{$substitution},
			     };
      }
    } else {
      push @newprototypes, {
			    Prototype => $prototype->{Prototype},
			    Probability => $prototype->{Probability},
			   };
    }
  }

  # PrintMessage(Dumper({MyPrototypes => \@newprototypes}));

  return GetAllPrototypesOfPerm
    (
     Perm => $args{Perm},
     Prototypes => \@newprototypes,
     Depth => $depth + 1,
     Input => $args{Input},
    );
}

sub PrettyPrint {
  my %args = @_;
  if (((scalar @prototype) / 2) < $minimumchanges) {
    return {
	    Success => 0,
	   };
  }

  my @prototype = @{$args{Prototype}->{Prototype}};
  my @breakdown;
  foreach my $list (@{$args{Input}->[0]->{Breakdown}}) {
    push @breakdown, @$list;
  }
  while (@prototype) {
    my $depth = shift @prototype;
    my $replacement = shift @prototype;
    my %lock = %{$args{Input}->[$depth]->{Lock}};
    my $smallestkey = 1000000;
    foreach my $key (keys %lock) {
      $breakdown[$key - 1] = undef;
      if ($key < $smallestkey) {
	$smallestkey = $key;
      }
    }
    $breakdown[$smallestkey - 1] = $noparens ? $replacement : "(".$replacement.")";
  }
  my @result;
  foreach my $item (@breakdown) {
    push @result, $item if defined $item;
  }
  return {
	  Success => 1,
	  Result => \@result,
	 };
}

sub PrintMessage {
  print join(" ",@_) if $verbose;
}

sub Score {
  my %args = @_;
  my $count = (scalar @{$args{Prototype}->{Prototype}}) / 2.0;
  my $score = $args{Prototype}->{Probability} * $count * $count * $count;
  return $score;
}

sub PrintScore {
  my %args = @_;
  my $count = (scalar @{$args{Prototype}->{Prototype}}) / 2;
  return $count.":".$args{Prototype}->{Probability};
}
