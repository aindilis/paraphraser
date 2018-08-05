#!/usr/bin/perl -w

use Data::Dumper;

my %args1 = ();

$args1{Perms} =
  [
   [
    0,
    1,
    1,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    0,
    1,
    0,
    1,
    1,
    1,
   ],
  ];

$args1{Input} =
  [
   {
    'Lock' => {
	       '3' => 1,
	       '2' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding'
		    ],
		    [
		     'of',
		     'multiple'
		    ],
		    [
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'Probability' => {
		      'different' => '0.055072',
		      'multilateral' => '0.027536',
		      'for multi' => '0.086957',
		      'to the multiplicity' => '0.055072'
		     },
    'ID' => 1
   },
   {
    'ID' => 2,
    'Probability' => {
		      'new study on' => '0.006757',
		      'new study' => '0.368928',
		      'new survey' => '0.014502',
		      'recent study' => '0.010918',
		      'new search' => '0.084544',
		      'modern study' => '0.019703',
		      'latest study' => '0.010986',
		      'recent research' => '0.004367',
		      'new study to' => '0.008108',
		      'new study about' => '0.010135'
		     },
    'Lock' => {
	       '5' => 1,
	       '4' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple'
		    ],
		    [
		     'new',
		     'research'
		    ],
		    [
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ]
   },
   {
    'ID' => 3,
    'Probability' => {
		      'authorities and' => '0.013364',
		      'organizations and' => '0.006682',
		      'his tendencies and' => '0.006098',
		      'dimensions and' => '0.009381',
		      'sides then it' => '0.014446',
		      'axes and' => '0.033753',
		      'dimensions' => '0.00469',
		      'fronts and' => '0.009756',
		      'its attitudes and' => '0.006098',
		      'organizations' => '0.015757',
		      'front lines' => '0.001626',
		      'authorities' => '0.022439',
		      'parties and' => '0.006682',
		      'approaches and' => '0.012544',
		      'drections and' => '0.009407',
		      'dimensions and that' => '0.012195',
		      'tendencies and' => '0.01626',
		      'sides and' => '0.003341',
		      'trends and' => '0.094108',
		      'axes' => '0.001381'
		     },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research'
		    ],
		    [
		     'directions',
		     'and'
		    ],
		    [
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'Lock' => {
	       '6' => 1,
	       '7' => 1
	      }
   },
   {
    'ID' => 4,
    'Probability' => {
		      'and businessmen' => '0.051923',
		      'and similar projects' => '0.051923',
		      'and plans' => '0.015929'
		     },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions'
		    ],
		    [
		     'and',
		     'projects'
		    ],
		    [
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'Lock' => {
	       '8' => 1,
	       '7' => 1
	      }
   },
   {
    'ID' => 5,
    'Probability' => {
		      'would promote' => '0.01294',
		      'be developed' => '0.01087',
		      'will boost' => '0.001035',
		      'will improve' => '0.00207',
		      'would improve' => '0.013458',
		      'improve' => '0.00207'
		     },
    'Lock' => {
	       '13' => 1,
	       '12' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that'
		    ],
		    [
		     'will',
		     'develop'
		    ],
		    [
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ]
   },
   {
    'Lock' => {
	       '15' => 1,
	       '14' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop'
		    ],
		    [
		     'new',
		     'principles'
		    ],
		    [
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'Probability' => {
		      'new bases' => '0.16'
		     },
    'ID' => 6
   },
   {
    'ID' => 7,
    'Probability' => {
		      'concepts and' => '0.01758',
		      'concepts' => '0.00187',
		      'bases and' => '0.007927',
		      'rules and' => '0.009695',
		      'constants and' => '0.004571'
		     },
    'Lock' => {
	       '15' => 1,
	       '16' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new'
		    ],
		    [
		     'principles',
		     'and'
		    ],
		    [
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ]
   },
   {
    'Lock' => {
	       '17' => 1,
	       '16' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles'
		    ],
		    [
		     'and',
		     'practice'
		    ],
		    [
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'ID' => 8,
    'Probability' => {
		      'secondly to apply' => '0.00463',
		      'and pracice' => '0.013889',
		      'or practicing' => '0.009259',
		      'practises' => '0.002941',
		      'actually' => '0.002315',
		      'practicing' => '0.016885',
		      'and practising' => '0.010757',
		      'and exercises' => '0.001471',
		      'and the exercise' => '0.001906',
		      'and having' => '0.002315',
		      'and actually' => '0.002315',
		      'and the observance' => '0.001906',
		      'practices' => '0.005882',
		      'and action' => '0.009259',
		      'and exercise' => '0.043982',
		      'and parcticing' => '0.00463',
		      'and exercising' => '0.00463',
		      'exercise' => '0.015109',
		      'and leading' => '0.002315',
		      'acts' => '0.004221',
		      'and practicing' => '0.165346',
		      'and practise' => '0.014106',
		      'it practices' => '0.001471',
		      'adopts' => '0.001471',
		      'and practise the' => '0.018518',
		      'and a further matter' => '0.002315',
		      'and using' => '0.00463',
		      'and deed' => '0.00463',
		      'and to exercise' => '0.00463',
		      'practising' => '0.003472',
		      'and use' => '0.00463',
		      'and exerting' => '0.009259',
		      'likes' => '0.00463'
		     }
   },
   {
    'Lock' => {
	       '18' => 1,
	       '17' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and'
		    ],
		    [
		     'practice',
		     'of'
		    ],
		    [
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'ID' => 9,
    'Probability' => {
		      'matter' => '0.083334',
		      'act of' => '0.166666',
		      'matter of' => '0.083334'
		     }
   },
   {
    'Lock' => {
	       '26' => 1,
	       '27' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ','
		    ],
		    [
		     'the',
		     'use'
		    ],
		    [
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'ID' => 10,
    'Probability' => {
		      'probability of using' => '0.003208',
		      'dependence' => '0.00308',
		      'resorting to the' => '0.002793',
		      'resorting to' => '0.073823',
		      'that using' => '0.007549',
		      'or to go to' => '0.001028',
		      'by using' => '0.001037',
		      'issue of the resorting' => '0.004951',
		      'depending' => '0.001787',
		      'to seek' => '0.002783',
		      'or resort to' => '0.001028',
		      'principle of using' => '0.009077',
		      'probable use' => '0.002674',
		      'seeking' => '0.003497',
		      'resorted to' => '0.001044',
		      'refuge' => '0.001506',
		      'finding' => '0.018584',
		      'asylum' => '0.046849',
		      'or being obliged to' => '0.003396',
		      'possibility of resorting' => '0.001068',
		      'interest' => '0.007982',
		      'possibility of using' => '0.002674',
		      'its weapons by' => '0.004539',
		      'asylum to' => '0.001863',
		      'seek' => '0.002162',
		      'may seek' => '0.003212',
		      'used' => '0.006593',
		      'depend' => '0.002453',
		      'inspections or resorting to' => '0.012103',
		      'resorting to use' => '0.003212',
		      'depending on' => '0.004091',
		      'resort to' => '0.02144',
		      'issue of the resorting to' => '0.006808',
		      'issue of resorting to' => '0.010212',
		      'disarm it by' => '0.002269',
		      'depend on' => '0.003151',
		      'resorting' => '0.025097',
		      'and using' => '0.002974',
		      'the alternative of using' => '0.005348',
		      'be used' => '0.006051',
		      'using' => '0.057084',
		      'disarm through' => '0.007262',
		      'go to' => '0.001095',
		      'resort' => '0.009185',
		      'probability of resorting' => '0.001068',
		      'or resorting to' => '0.007819',
		      'dependence on' => '0.007232',
		      'issue of resorting' => '0.007427',
		      'issue of asylum' => '0.002476'
		     }
   },
   {
    'Lock' => {
	       '28' => 1,
	       '27' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the'
		    ],
		    [
		     'use',
		     'of'
		    ],
		    [
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'ID' => 11,
    'Probability' => {
		      'can benefit from' => '0.001722',
		      'the way to using' => '0.002936',
		      'benefit from' => '0.042095',
		      'for asylum' => '0.001053',
		      'one will benefit from' => '0.004038',
		      'aim' => '0.002379',
		      'taking advantage of' => '0.001937',
		      'utilize' => '0.002622',
		      'benefits from' => '0.00141',
		      'to seeking' => '0.001615',
		      'of using' => '0.012445',
		      'of benefiting from' => '0.005298',
		      'using' => '0.035811',
		      'used by' => '0.001468',
		      'beneficiaries of' => '0.001024',
		      'benefited from' => '0.002723',
		      'to resorting' => '0.001053',
		      'resort to' => '0.022344',
		      'to resort' => '0.005267',
		      'benefit from the' => '0.004894',
		      'to resort to' => '0.003769',
		      'beneficiaries' => '0.001228',
		      'interest of' => '0.00119',
		      'way to use' => '0.011746',
		      'asylum to' => '0.002514',
		      'benifit from' => '0.005408',
		      'used' => '0.012714',
		      'for resorting to' => '0.001927',
		      'get benefit from' => '0.002172',
		      'benefit' => '0.002687',
		      'unable to' => '0.001365',
		      'the way to use' => '0.005873',
		      'exhaust' => '0.001302',
		      'asylum' => '0.00838',
		      'depending' => '0.001812',
		      'to benefit from' => '0.003922',
		      'taking to' => '0.001365',
		      'benefiting from' => '0.024589',
		      'seeking' => '0.001365',
		      'beneficiaries from' => '0.001098',
		      'resorted to' => '0.002495',
		      'its usage of' => '0.001468',
		      'from benefiting from' => '0.002619',
		      'for using' => '0.005921',
		      'benefitting from' => '0.002396',
		      'from using' => '0.004897',
		      'used to' => '0.001468',
		      'that resorting to' => '0.001864',
		      'way for using' => '0.001468',
		      'take advantage of' => '0.001787',
		      'for resorting' => '0.002668',
		      'useless' => '0.028227',
		      'benefits of' => '0.001343',
		      'way to the use' => '0.001468',
		      'resorting to' => '0.068433',
		      'way to using' => '0.002936',
		      'way to' => '0.00584',
		      'to resorting to' => '0.001927',
		      'advantage' => '0.001803',
		      'avail' => '0.009978'
		     }
   },
   {
    'ID' => 12,
    'Probability' => {
		      'of the growth' => '0.003742',
		      'of growing' => '0.014969',
		      'developments' => '0.003322',
		      'evolution' => '0.013289',
		      'for growing' => '0.007484',
		      'developing its' => '0.004983',
		      'it developed' => '0.002492',
		      'developing' => '0.016155',
		      'for the growth' => '0.003645',
		      'of the progress of the' => '0.003033',
		      'increase of' => '0.003742',
		      'it develops' => '0.002492',
		      'developed' => '0.004412',
		      'developed to' => '0.018272',
		      'growth' => '0.021217',
		      'develop to' => '0.004983'
		     },
    'Lock' => {
	       '40' => 1,
	       '41' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further'
		    ],
		    [
		     'development',
		     'of'
		    ],
		    [
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ]
   },
   {
    'Lock' => {
	       '11' => 1,
	       '12' => 1,
	       '10' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':'
		    ],
		    [
		     'projects',
		     'that',
		     'will'
		    ],
		    [
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'ID' => 13,
    'Probability' => {
		      'projects planned' => '0.05'
		     }
   },
   {
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ','
		    ],
		    [
		     'the',
		     'use',
		     'of'
		    ],
		    [
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further',
		     'development',
		     'of',
		     'the',
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ],
    'Lock' => {
	       '26' => 1,
	       '27' => 1,
	       '28' => 1
	      },
    'Probability' => {
		      'resort to' => '0.078471',
		      'the asylum to' => '0.004024',
		      'seek' => '0.004024',
		      'asylum to' => '0.012072',
		      'used' => '0.008048',
		      'political asylum' => '0.004024',
		      'interest of' => '0.034483',
		      'interest' => '0.011494',
		      'the resort to' => '0.008048',
		      'resorting to' => '0.325956',
		      'unable to' => '0.008048',
		      'refuge to' => '0.004024',
		      'asylum' => '0.016097',
		      'benefit from' => '0.103449',
		      'using' => '0.074447',
		      'seeking' => '0.008048',
		      'taking to' => '0.008048'
		     },
    'ID' => 14
   },
   {
    'Probability' => {
		      'developed' => '0.006662',
		      'develops' => '0.003598',
		      'developing' => '0.004931',
		      'progress' => '0.001399',
		      'developments' => '0.003434'
		     },
    'ID' => 15,
    'Lock' => {
	       '40' => 1,
	       '41' => 1,
	       '42' => 1
	      },
    'Breakdown' => [
		    [
		     'Seeding',
		     'of',
		     'multiple',
		     'new',
		     'research',
		     'directions',
		     'and',
		     'projects',
		     ':',
		     'projects',
		     'that',
		     'will',
		     'develop',
		     'new',
		     'principles',
		     'and',
		     'practice',
		     'of',
		     'automated',
		     'theorem',
		     'proving',
		     'for',
		     'higher-order',
		     'logic',
		     ',',
		     'the',
		     'use',
		     'of',
		     'higher-order',
		     'logic',
		     'for',
		     'theorem',
		     'proving',
		     'in',
		     'non-classical',
		     'logics',
		     ',',
		     'and',
		     'further'
		    ],
		    [
		     'development',
		     'of',
		     'the'
		    ],
		    [
		     'TPTP',
		     'THF',
		     'infrastructure',
		     '.'
		    ]
		   ]
   }
  ];


print Dumper(GetAllPrototypes());

sub GetAllPrototypes {
  # my %args = @_;
  my %args = %args1;
  my @paraphrases;
  foreach my $perm (@{$args{Perms}}) {
    push @paraphrases, @{GetAllPrototypesOfPerm(Depth => 0, Perm => $perm, Prototypes => [{Prototype => [], Probability => 1.0}], Input => $args{Input})};
  }
  return \@paraphrases;
}


sub GetAllPrototypesOfPerm {
  my %args = @_;
  my $depth = $args{Depth};
  print Dumper
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
  my @keys = keys %{$args{Input}->[$depth]->{Probability}};
  # print Dumper({Keys => \@keys});
  foreach my $prototype (@{$args{Prototypes}}) {
    if ($args{Perm}->[$depth] and scalar @keys) {
      # need to substitute all different items in here
      foreach my $substitution (@keys) {
	# print Dumper({Substitution => $substitution});
	# my @tokens = split /\s+/, $substitution;
	my @newprototype = [@{$prototype->{Prototype}},$substitution];
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

  return GetAllPrototypesOfPerm
    (
     Perm => $args{Perm},
     Prototypes => \@newprototypes,
     Depth => $depth + 1,
     Input => $args{Input},
    );
}
