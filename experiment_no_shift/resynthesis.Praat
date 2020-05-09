###  meredith, lookslike stimuli, 11/20/2011
###
###  this script takes a sound/textgrid pair (just one) and resynthesizes its f0 & duration
###  resynthesized soundfiles are output to the object window (not automatically saved)

### setup

# get both soundfile and textgrid
# filename of textgrid must be same as filename of soundfile
# filename should correspond to a contrastive prosody token

#  cake, horse, umbrella, cat, sundial, panda, tadpole, railroad, reindeer, rainbow, 
#  skateboard, spoon, mouse, sailboat, baseball, zebra, wheel, butterfly, flower, hammer, 
#  hedgehog, monkey, wasps' nest, shark, rabbit, cellphone

directory$ = "/Users/mbrown/Dropbox/lookslikecontinua/v2/recordings/"
clearinfo

# iterates through all soundfiles in directory
Create Strings as file list... list 'directory$'*.wav
filenum = Get number of strings
for stimfilenum from 1 to filenum

	# get both soundfile and textgrid
	select Strings list
	soundfile$ = Get string... 'stimfilenum'
	Read from file... 'directory$''soundfile$'
	stimname$ = selected$ ("Sound")
	Edit
	Read from file... 'directory$''stimname$'.TextGrid



# get number of intervals in textgrid
select TextGrid 'stimname$'
number_intervals = Get number of intervals... 1



#### FIRST CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-1"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 259.09404
            elsif samplenum = 6
                Add point... 'sample' 257.165788889
            elsif samplenum = 7
                Add point... 'sample' 256.488182456
            elsif samplenum = 8
                Add point... 'sample' 254.698569565
            elsif samplenum = 9
                Add point... 'sample' 253.417938356
            elsif samplenum = 10
                Add point... 'sample' 251.806263636
            elsif samplenum = 11
                Add point... 'sample' 251.196652564
            elsif samplenum = 12
                Add point... 'sample' 250.788484615
            elsif samplenum = 13
                Add point... 'sample' 250.337585897
            elsif samplenum = 14
                Add point... 'sample' 249.983233333
            elsif samplenum = 15
                Add point... 'sample' 249.035854795
            elsif samplenum = 16
                Add point... 'sample' 248.097595238
            elsif samplenum = 17
                Add point... 'sample' 244.163978788
            elsif samplenum = 18
                Add point... 'sample' 236.06938
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8557
		Add point... 'beforeintervalend' 0.8557
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
            while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 219.8936
            elsif samplenum = 4
                Add point... 'sample' 233.153431169
            elsif samplenum = 5
                Add point... 'sample' 238.694169333
            elsif samplenum = 6
                Add point... 'sample' 245.734198684
            elsif samplenum = 7
                Add point... 'sample' 250.228265385
            elsif samplenum = 8
                Add point... 'sample' 249.163625316
            elsif samplenum = 9
                Add point... 'sample' 247.663325316
            elsif samplenum = 10
                Add point... 'sample' 247.211859494
            elsif samplenum = 11
                Add point... 'sample' 245.891864557
            elsif samplenum = 12
                Add point... 'sample' 241.644567606
            elsif samplenum = 13
                Add point... 'sample' 230.515880702
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.5499
		Add point... 'beforeintervalend' 0.5499
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 246.249891489
            elsif samplenum = 6
                Add point... 'sample' 242.59411039
            elsif samplenum = 7
                Add point... 'sample' 238.924779747
            elsif samplenum = 8
                Add point... 'sample' 235.796051899
            elsif samplenum = 9
                Add point... 'sample' 232.772420253
            elsif samplenum = 10
                Add point... 'sample' 229.520308861
            elsif samplenum = 11
                Add point... 'sample' 223.900624051
            elsif samplenum = 12
                Add point... 'sample' 215.688974684
            elsif samplenum = 13
                Add point... 'sample' 208.472201316
            elsif samplenum = 14
                Add point... 'sample' 203.457170968
            elsif samplenum = 15
                Add point... 'sample' 202.461906667
            elsif samplenum = 16
                Add point... 'sample' 200.184728571
            elsif samplenum = 17
                Add point... 'sample' 201.100257143
            elsif samplenum = 18
                Add point... 'sample' 200.077466667
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8271
		Add point... 'beforeintervalend' 0.8271
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 218.6007
            elsif samplenum = 6
                Add point... 'sample' 218.690162162
            elsif samplenum = 7
                Add point... 'sample' 218.072374603
            elsif samplenum = 8
                Add point... 'sample' 218.391032877
            elsif samplenum = 9
                Add point... 'sample' 218.788758974
            elsif samplenum = 10
                Add point... 'sample' 218.749005063
            elsif samplenum = 11
                Add point... 'sample' 218.239353165
            elsif samplenum = 12
                Add point... 'sample' 217.287346835
           elsif samplenum = 13
                Add point... 'sample' 216.135355696
            elsif samplenum = 14
                Add point... 'sample' 215.335145455
            elsif samplenum = 15
                Add point... 'sample' 214.738251471
            elsif samplenum = 16
                Add point... 'sample' 212.917536207
            elsif samplenum = 17
                Add point... 'sample' 211.190503226
            elsif samplenum = 18
                Add point... 'sample' 209.551511111
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9648
		Add point... 'beforeintervalend' 0.9648
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 222.098066667
            elsif samplenum = 4
                Add point... 'sample' 218.861543902
            elsif samplenum = 5
                Add point... 'sample' 219.495993023
            elsif samplenum = 6
                Add point... 'sample' 225.226852174
            elsif samplenum = 7
                Add point... 'sample' 237.3694
            elsif samplenum = 8
                Add point... 'sample' 250.769784
            elsif samplenum = 9
                Add point... 'sample' 260.928107547
            elsif samplenum = 10
                Add point... 'sample' 270.825047619
            elsif samplenum = 11
                Add point... 'sample' 279.7511625
            elsif samplenum = 12
                Add point... 'sample' 285.236356716
            elsif samplenum = 13
                Add point... 'sample' 288.413256338
            elsif samplenum = 14
                Add point... 'sample' 292.786347059
            elsif samplenum = 15
                Add point... 'sample' 298.124107042
            elsif samplenum = 16
                Add point... 'sample' 302.766646875
            elsif samplenum = 17
                Add point... 'sample' 303.977304918
            elsif samplenum = 18
                Add point... 'sample' 301.463242373
            elsif samplenum = 19
                Add point... 'sample' 297.750014815
            elsif samplenum = 20
                Add point... 'sample' 273.192713333
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9827
		Add point... 'beforeintervalend' 0.9827
		Add point... 'intervalend' 1
			
	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 239.853576316
            elsif samplenum = 4
                Add point... 'sample' 226.668148438
            elsif samplenum = 5
                Add point... 'sample' 210.666210145
            elsif samplenum = 6
                Add point... 'sample' 199.867237681
            elsif samplenum = 7
                Add point... 'sample' 194.597093243
            elsif samplenum = 8
                Add point... 'sample' 189.942948684
            elsif samplenum = 9
                Add point... 'sample' 186.725152632
            elsif samplenum = 10
                Add point... 'sample' 184.668902778
            elsif samplenum = 11
                Add point... 'sample' 182.769467647
            elsif samplenum = 12
                Add point... 'sample' 182.775838235
            elsif samplenum = 13
                Add point... 'sample' 183.688389706
            elsif samplenum = 14
                Add point... 'sample' 185.326288235
            elsif samplenum = 15
                Add point... 'sample' 188.09300303
            elsif samplenum = 16
                Add point... 'sample' 193.889466667
            elsif samplenum = 17
                Add point... 'sample' 198.647094737
            elsif samplenum = 18
                Add point... 'sample' 197.550229091
            elsif samplenum = 19
                Add point... 'sample' 198.755079592
            elsif samplenum = 20
                Add point... 'sample' 196.4580875
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.1543
		Add point... 'beforeintervalend' 1.1543
		Add point... 'intervalend' 1
			
		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation
	endif
endfor







#### SECOND CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-2"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 5 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 259.300312121
            elsif samplenum = 6
                Add point... 'sample' 257.187159101
            elsif samplenum = 7
                Add point... 'sample' 256.611682622
            elsif samplenum = 8
                Add point... 'sample' 255.002790145
            elsif samplenum = 9
                Add point... 'sample' 253.93225951
            elsif samplenum = 10
                Add point... 'sample' 252.563987995
            elsif samplenum = 11
                Add point... 'sample' 252.102679963
            elsif samplenum = 12
                Add point... 'sample' 251.805630033
            elsif samplenum = 13
                Add point... 'sample' 251.40499875
            elsif samplenum = 14
                Add point... 'sample' 251.084609878
            elsif samplenum = 15
                Add point... 'sample' 250.172470268
            elsif samplenum = 16
                Add point... 'sample' 249.24385856
            elsif samplenum = 17
                Add point... 'sample' 245.529152744
            elsif samplenum = 18
                Add point... 'sample' 238.055755615
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8688
		Add point... 'beforeintervalend' 0.8688
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 222.406254196
            elsif samplenum = 4
                Add point... 'sample' 234.626664699
            elsif samplenum = 5
                Add point... 'sample' 240.596368461
            elsif samplenum = 6
                Add point... 'sample' 248.513798686
            elsif samplenum = 7
                Add point... 'sample' 254.513916783
            elsif samplenum = 8
                Add point... 'sample' 255.397738516
            elsif samplenum = 9
                Add point... 'sample' 256.322167654
            elsif samplenum = 10
                Add point... 'sample' 258.227244277
            elsif samplenum = 11
                Add point... 'sample' 258.763181755
            elsif samplenum = 12
                Add point... 'sample' 255.535049708
            elsif samplenum = 13
                Add point... 'sample' 245.650979426
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.5909
		Add point... 'beforeintervalend' 0.5909
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 243.240592386
            elsif samplenum = 6
                Add point... 'sample' 239.58750152
            elsif samplenum = 7
                Add point... 'sample' 235.895211308
            elsif samplenum = 8
                Add point... 'sample' 232.784367693
            elsif samplenum = 9
                Add point... 'sample' 229.857071093
            elsif samplenum = 10
                Add point... 'sample' 226.744901412
            elsif samplenum = 11
                Add point... 'sample' 221.409351002
            elsif samplenum = 12
                Add point... 'sample' 213.648003442
            elsif samplenum = 13
                Add point... 'sample' 206.860574776
            elsif samplenum = 14
                Add point... 'sample' 202.095375772
            elsif samplenum = 15
                Add point... 'sample' 201.397266288
            elsif samplenum = 16
                Add point... 'sample' 198.960400216
            elsif samplenum = 17
                Add point... 'sample' 199.819158009
            elsif samplenum = 18
                Add point... 'sample' 198.857160606
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8428
		Add point... 'beforeintervalend' 0.8428
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 216.758725837
            elsif samplenum = 6
                Add point... 'sample' 216.671570516
            elsif samplenum = 7
                Add point... 'sample' 216.169449639
            elsif samplenum = 8
                Add point... 'sample' 216.360513243
            elsif samplenum = 9
                Add point... 'sample' 216.805551221
            elsif samplenum = 10
                Add point... 'sample' 216.690263517
            elsif samplenum = 11
                Add point... 'sample' 216.199582098
            elsif samplenum = 12
                Add point... 'sample' 215.294285317
            elsif samplenum = 13
                Add point... 'sample' 214.221644021
            elsif samplenum = 14
                Add point... 'sample' 213.487152133
            elsif samplenum = 15
                Add point... 'sample' 212.955225201
            elsif samplenum = 16
                Add point... 'sample' 211.284120932
            elsif samplenum = 17
                Add point... 'sample' 209.699882586
            elsif samplenum = 18
                Add point... 'sample' 208.273799495
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.968
		Add point... 'beforeintervalend' 0.968
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 219.562010606
            elsif samplenum = 4
                Add point... 'sample' 216.676952411
            elsif samplenum = 5
                Add point... 'sample' 217.252219277
            elsif samplenum = 6
                Add point... 'sample' 222.488000285
            elsif samplenum = 7
                Add point... 'sample' 233.809723017
            elsif samplenum = 8
                Add point... 'sample' 245.758316114
            elsif samplenum = 9
                Add point... 'sample' 254.941407357
            elsif samplenum = 10
                Add point... 'sample' 264.080422367
            elsif samplenum = 11
                Add point... 'sample' 271.913723262
            elsif samplenum = 12
                Add point... 'sample' 276.818430721
            elsif samplenum = 13
                Add point... 'sample' 279.709226042
            elsif samplenum = 14
                Add point... 'sample' 283.724380094
            elsif samplenum = 15
                Add point... 'sample' 288.536946517
            elsif samplenum = 16
                Add point... 'sample' 292.713196293
            elsif samplenum = 17
                Add point... 'sample' 293.802568261
            elsif samplenum = 18
                Add point... 'sample' 291.538398835
            elsif samplenum = 19
                Add point... 'sample' 288.082513855
            elsif samplenum = 20
                Add point... 'sample' 265.579311212
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9843
		Add point... 'beforeintervalend' 0.9843
		Add point... 'intervalend' 1
			
	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 237.047889141
            elsif samplenum = 4
                Add point... 'sample' 224.861288962
            elsif samplenum = 5
                Add point... 'sample' 210.336304366
            elsif samplenum = 6
                Add point... 'sample' 200.704103789
            elsif samplenum = 7
                Add point... 'sample' 196.289835245
            elsif samplenum = 8
                Add point... 'sample' 192.091964137
            elsif samplenum = 9
                Add point... 'sample' 189.181420444
            elsif samplenum = 10
                Add point... 'sample' 187.512671534
            elsif samplenum = 11
                Add point... 'sample' 186.234064574
            elsif samplenum = 12
                Add point... 'sample' 186.763993708
            elsif samplenum = 13
                Add point... 'sample' 188.207207687
            elsif samplenum = 14
                Add point... 'sample' 190.316267371
            elsif samplenum = 15
                Add point... 'sample' 193.499114338
            elsif samplenum = 16
                Add point... 'sample' 199.411762763
            elsif samplenum = 17
                Add point... 'sample' 204.590286587
            elsif samplenum = 18
                Add point... 'sample' 204.12314432
            elsif samplenum = 19
                Add point... 'sample' 205.45957996
            elsif samplenum = 20
                Add point... 'sample' 203.941091667
            endif
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0886
		Add point... 'beforeintervalend' 1.0886
		Add point... 'intervalend' 1
			
		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation
	endif
endfor






#### THIRD CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-3"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 259.506584242
            elsif samplenum = 6
                Add point... 'sample' 257.208529314
            elsif samplenum = 7
                Add point... 'sample' 256.735182789
            elsif samplenum = 8
                Add point... 'sample' 255.307010725
            elsif samplenum = 9
                Add point... 'sample' 254.446580665
            elsif samplenum = 10
                Add point... 'sample' 253.321712353
            elsif samplenum = 11
                Add point... 'sample' 253.008707361
            elsif samplenum = 12
                Add point... 'sample' 252.822775451
            elsif samplenum = 13
                Add point... 'sample' 252.472411602
            elsif samplenum = 14
                Add point... 'sample' 252.185986423
            elsif samplenum = 15
                Add point... 'sample' 251.309085741
            elsif samplenum = 16
                Add point... 'sample' 250.390121882
            elsif samplenum = 17
                Add point... 'sample' 246.894326701
            elsif samplenum = 18
                Add point... 'sample' 240.04213123
            endif
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.882
		Add point... 'beforeintervalend' 0.882
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
		while samplenum <= 20
         while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 224.918908392
            elsif samplenum = 4
                Add point... 'sample' 236.099898229
            elsif samplenum = 5
                Add point... 'sample' 242.498567589
            elsif samplenum = 6
                Add point... 'sample' 251.293398687
            elsif samplenum = 7
                Add point... 'sample' 258.799568182
            elsif samplenum = 8
                Add point... 'sample' 261.631851716
            elsif samplenum = 9
                Add point... 'sample' 264.981009991
            elsif samplenum = 10
                Add point... 'sample' 269.242629059
            elsif samplenum = 11
                Add point... 'sample' 271.634498952
            elsif samplenum = 12
                Add point... 'sample' 269.42553181
            elsif samplenum = 13
                Add point... 'sample' 260.78607815
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.6318
		Add point... 'beforeintervalend' 0.6318
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 240.231293282
            elsif samplenum = 6
                Add point... 'sample' 236.58089265
            elsif samplenum = 7
                Add point... 'sample' 232.86564287
            elsif samplenum = 8
                Add point... 'sample' 229.772683488
            elsif samplenum = 9
                Add point... 'sample' 226.941721932
            elsif samplenum = 10
                Add point... 'sample' 223.969493963
            elsif samplenum = 11
                Add point... 'sample' 218.918077953
            elsif samplenum = 12
                Add point... 'sample' 211.6070322
            elsif samplenum = 13
                Add point... 'sample' 205.248948236
            elsif samplenum = 14
                Add point... 'sample' 200.733580575
            elsif samplenum = 15
                Add point... 'sample' 200.332625909
            elsif samplenum = 16
                Add point... 'sample' 197.736071861
            elsif samplenum = 17
                Add point... 'sample' 198.538058874
            elsif samplenum = 18
                Add point... 'sample' 197.636854545
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8585
		Add point... 'beforeintervalend' 0.8585
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 214.916751675
            elsif samplenum = 6
                Add point... 'sample' 214.65297887
            elsif samplenum = 7
                Add point... 'sample' 214.266524675
            elsif samplenum = 8
                Add point... 'sample' 214.329993608
            elsif samplenum = 9
                Add point... 'sample' 214.822343467
            elsif samplenum = 10
                Add point... 'sample' 214.63152197
            elsif samplenum = 11
                Add point... 'sample' 214.159811031
            elsif samplenum = 12
                Add point... 'sample' 213.301223798
            elsif samplenum = 13
                Add point... 'sample' 212.307932346
            elsif samplenum = 14
                Add point... 'sample' 211.639158812
            elsif samplenum = 15
                Add point... 'sample' 211.17219893
            elsif samplenum = 16
                Add point... 'sample' 209.650705657
            elsif samplenum = 17
                Add point... 'sample' 208.209261947
            elsif samplenum = 18
                Add point... 'sample' 206.996087879
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9712
		Add point... 'beforeintervalend' 0.9712
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 217.025954545
            elsif samplenum = 4
                Add point... 'sample' 214.49236092
            elsif samplenum = 5
                Add point... 'sample' 215.008445531
            elsif samplenum = 6
                Add point... 'sample' 219.749148396
            elsif samplenum = 7
                Add point... 'sample' 230.250046035
            elsif samplenum = 8
                Add point... 'sample' 240.746848228
            elsif samplenum = 9
                Add point... 'sample' 248.954707167
            elsif samplenum = 10
                Add point... 'sample' 257.335797114
            elsif samplenum = 11
                Add point... 'sample' 264.076284024
            elsif samplenum = 12
                Add point... 'sample' 268.400504726
            elsif samplenum = 13
                Add point... 'sample' 271.005195745
            elsif samplenum = 14
                Add point... 'sample' 274.66241313
            elsif samplenum = 15
                Add point... 'sample' 278.949785993
            elsif samplenum = 16
                Add point... 'sample' 282.659745712
            elsif samplenum = 17
                Add point... 'sample' 283.627831605
            elsif samplenum = 18
                Add point... 'sample' 281.613555298
            elsif samplenum = 19
                Add point... 'sample' 278.415012895
            elsif samplenum = 20
                Add point... 'sample' 257.965909091
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9859
		Add point... 'beforeintervalend' 0.9859
		Add point... 'intervalend' 1

	### modifying f0 & dur of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 234.242201966
            elsif samplenum = 4
                Add point... 'sample' 223.054429486
            elsif samplenum = 5
                Add point... 'sample' 210.006398587
            elsif samplenum = 6
                Add point... 'sample' 201.540969896
            elsif samplenum = 7
                Add point... 'sample' 197.982577247
            elsif samplenum = 8
                Add point... 'sample' 194.24097959
            elsif samplenum = 9
                Add point... 'sample' 191.637688257
            elsif samplenum = 10
                Add point... 'sample' 190.356440289
            elsif samplenum = 11
                Add point... 'sample' 189.698661501
            elsif samplenum = 12
                Add point... 'sample' 190.752149181
            elsif samplenum = 13
                Add point... 'sample' 192.726025668
            elsif samplenum = 14
                Add point... 'sample' 195.306246507
            elsif samplenum = 15
                Add point... 'sample' 198.905225646
            elsif samplenum = 16
                Add point... 'sample' 204.93405886
            elsif samplenum = 17
                Add point... 'sample' 210.533478436
            elsif samplenum = 18
                Add point... 'sample' 210.696059549
            elsif samplenum = 19
                Add point... 'sample' 212.164080327
            elsif samplenum = 20
                Add point... 'sample' 211.424095833
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0798
		Add point... 'beforeintervalend' 1.0798
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation
	endif
endfor







#### FOURTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-4"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 259.712856364
            elsif samplenum = 6
                Add point... 'sample' 257.229899526
            elsif samplenum = 7
                Add point... 'sample' 256.858682955
            elsif samplenum = 8
                Add point... 'sample' 255.611231305
            elsif samplenum = 9
                Add point... 'sample' 254.960901819
            elsif samplenum = 10
                Add point... 'sample' 254.079436712
            elsif samplenum = 11
                Add point... 'sample' 253.91473476
            elsif samplenum = 12
                Add point... 'sample' 253.839920869
            elsif samplenum = 13
                Add point... 'sample' 253.539824454
            elsif samplenum = 14
                Add point... 'sample' 253.287362967
            elsif samplenum = 15
                Add point... 'sample' 252.445701214
            elsif samplenum = 16
                Add point... 'sample' 251.536385204
            elsif samplenum = 17
                Add point... 'sample' 248.259500657
            elsif samplenum = 18
                Add point... 'sample' 242.028506845
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8951
		Add point... 'beforeintervalend' 0.8951
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 227.431562587
            elsif samplenum = 4
                Add point... 'sample' 237.573131759
            elsif samplenum = 5
                Add point... 'sample' 244.400766717
            elsif samplenum = 6
                Add point... 'sample' 254.072998689
            elsif samplenum = 7
                Add point... 'sample' 263.08521958
            elsif samplenum = 8
                Add point... 'sample' 267.865964915
            elsif samplenum = 9
                Add point... 'sample' 273.639852328
            elsif samplenum = 10
                Add point... 'sample' 280.258013842
            elsif samplenum = 11
                Add point... 'sample' 284.50581615
            elsif samplenum = 12
                Add point... 'sample' 283.316013913
            elsif samplenum = 13
                Add point... 'sample' 275.921176874
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.6727
		Add point... 'beforeintervalend' 0.6727
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 237.221994179
            elsif samplenum = 6
                Add point... 'sample' 233.57428378
            elsif samplenum = 7
                Add point... 'sample' 229.836074431
            elsif samplenum = 8
                Add point... 'sample' 226.760999283
            elsif samplenum = 9
                Add point... 'sample' 224.026372772
            elsif samplenum = 10
                Add point... 'sample' 221.194086514
            elsif samplenum = 11
                Add point... 'sample' 216.426804904
            elsif samplenum = 12
                Add point... 'sample' 209.566060959
            elsif samplenum = 13
                Add point... 'sample' 203.637321696
            elsif samplenum = 14
                Add point... 'sample' 199.371785379
            elsif samplenum = 15
                Add point... 'sample' 199.26798553
            elsif samplenum = 16
                Add point... 'sample' 196.511743506
            elsif samplenum = 17
                Add point... 'sample' 197.25695974
            elsif samplenum = 18
                Add point... 'sample' 196.416548485
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8743
		Add point... 'beforeintervalend' 0.8743
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 213.074777512
            elsif samplenum = 6
                Add point... 'sample' 212.634387224
            elsif samplenum = 7
                Add point... 'sample' 212.363599711
            elsif samplenum = 8
                Add point... 'sample' 212.299473974
            elsif samplenum = 9
                Add point... 'sample' 212.839135713
            elsif samplenum = 10
                Add point... 'sample' 212.572780424
            elsif samplenum = 11
                Add point... 'sample' 212.120039964
            elsif samplenum = 12
                Add point... 'sample' 211.308162279
            elsif samplenum = 13
                Add point... 'sample' 210.394220672
            elsif samplenum = 14
                Add point... 'sample' 209.79116549
            elsif samplenum = 15
                Add point... 'sample' 209.38917266
            elsif samplenum = 16
                Add point... 'sample' 208.017290382
            elsif samplenum = 17
                Add point... 'sample' 206.718641307
            elsif samplenum = 18
                Add point... 'sample' 205.718376263
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9744
		Add point... 'beforeintervalend' 0.9744
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 214.489898485
            elsif samplenum = 4
                Add point... 'sample' 212.307769429
            elsif samplenum = 5
                Add point... 'sample' 212.764671786
            elsif samplenum = 6
                Add point... 'sample' 217.010296507
            elsif samplenum = 7
                Add point... 'sample' 226.690369052
            elsif samplenum = 8
                Add point... 'sample' 235.735380342
            elsif samplenum = 9
                Add point... 'sample' 242.968006976
            elsif samplenum = 10
                Add point... 'sample' 250.591171861
            elsif samplenum = 11
                Add point... 'sample' 256.238844786
            elsif samplenum = 12
                Add point... 'sample' 259.982578731
            elsif samplenum = 13
                Add point... 'sample' 262.301165449
            elsif samplenum = 14
                Add point... 'sample' 265.600446165
            elsif samplenum = 15
                Add point... 'sample' 269.362625468
            elsif samplenum = 16
                Add point... 'sample' 272.60629513
            elsif samplenum = 17
                Add point... 'sample' 273.453094948
            elsif samplenum = 18
                Add point... 'sample' 271.688711761
            elsif samplenum = 19
                Add point... 'sample' 268.747511935
            elsif samplenum = 20
                Add point... 'sample' 250.35250697
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9874
		Add point... 'beforeintervalend' 0.9874
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 231.436514791
            elsif samplenum = 4
                Add point... 'sample' 221.24757001
            elsif samplenum = 5
                Add point... 'sample' 209.676492808
            elsif samplenum = 6
                Add point... 'sample' 202.377836004
            elsif samplenum = 7
                Add point... 'sample' 199.675319249
            elsif samplenum = 8
                Add point... 'sample' 196.389995043
            elsif samplenum = 9
                Add point... 'sample' 194.09395607
            elsif samplenum = 10
                Add point... 'sample' 193.200209045
            elsif samplenum = 11
                Add point... 'sample' 193.163258429
            elsif samplenum = 12
                Add point... 'sample' 194.740304654
            elsif samplenum = 13
                Add point... 'sample' 197.24484365
            elsif samplenum = 14
                Add point... 'sample' 200.296225643
            elsif samplenum = 15
                Add point... 'sample' 204.311336955
            elsif samplenum = 16
                Add point... 'sample' 210.456354956
            elsif samplenum = 17
                Add point... 'sample' 216.476670286
            elsif samplenum = 18
                Add point... 'sample' 217.268974778
            elsif samplenum = 19
                Add point... 'sample' 218.868580695
            elsif samplenum = 20
                Add point... 'sample' 218.9071
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0709
		Add point... 'beforeintervalend' 1.0709
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation
	endif
endfor




#### FIFTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-5"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 259.919128485
            elsif samplenum = 6
                Add point... 'sample' 257.251269738
            elsif samplenum = 7
                Add point... 'sample' 256.982183121
            elsif samplenum = 8
                Add point... 'sample' 255.915451885
            elsif samplenum = 9
                Add point... 'sample' 255.475222973
            elsif samplenum = 10
                Add point... 'sample' 254.83716107
            elsif samplenum = 11
                Add point... 'sample' 254.820762158
            elsif samplenum = 12
                Add point... 'sample' 254.857066286
            elsif samplenum = 13
                Add point... 'sample' 254.607237307
            elsif samplenum = 14
                Add point... 'sample' 254.388739512
            elsif samplenum = 15
                Add point... 'sample' 253.582316687
            elsif samplenum = 16
                Add point... 'sample' 252.682648526
            elsif samplenum = 17
                Add point... 'sample' 249.624674613
            elsif samplenum = 18
                Add point... 'sample' 244.01488246
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9082
		Add point... 'beforeintervalend' 0.9082
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 229.944216783
            elsif samplenum = 4
                Add point... 'sample' 239.046365289
            elsif samplenum = 5
                Add point... 'sample' 246.302965845
            elsif samplenum = 6
                Add point... 'sample' 256.85259869
            elsif samplenum = 7
                Add point... 'sample' 267.370870979
            elsif samplenum = 8
                Add point... 'sample' 274.100078115
            elsif samplenum = 9
                Add point... 'sample' 282.298694665
            elsif samplenum = 10
                Add point... 'sample' 291.273398625
            elsif samplenum = 11
                Add point... 'sample' 297.377133348
            elsif samplenum = 12
                Add point... 'sample' 297.206496015
            elsif samplenum = 13
                Add point... 'sample' 291.056275598
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.7136
		Add point... 'beforeintervalend' 0.7136
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 234.212695076
            elsif samplenum = 6
                Add point... 'sample' 230.56767491
            elsif samplenum = 7
                Add point... 'sample' 226.806505993
            elsif samplenum = 8
                Add point... 'sample' 223.749315078
            elsif samplenum = 9
                Add point... 'sample' 221.111023611
            elsif samplenum = 10
                Add point... 'sample' 218.418679065
            elsif samplenum = 11
                Add point... 'sample' 213.935531855
            elsif samplenum = 12
                Add point... 'sample' 207.525089717
            elsif samplenum = 13
                Add point... 'sample' 202.025695156
            elsif samplenum = 14
                Add point... 'sample' 198.009990183
            elsif samplenum = 15
                Add point... 'sample' 198.203345152
            elsif samplenum = 16
                Add point... 'sample' 195.287415152
            elsif samplenum = 17
                Add point... 'sample' 195.975860606
            elsif samplenum = 18
                Add point... 'sample' 195.196242424
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.89
		Add point... 'beforeintervalend' 0.89
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 5 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 211.232803349
            elsif samplenum = 6
                Add point... 'sample' 210.615795577
            elsif samplenum = 7
                Add point... 'sample' 210.460674747
            elsif samplenum = 8
                Add point... 'sample' 210.26895434
            elsif samplenum = 9
                Add point... 'sample' 210.85592796
            elsif samplenum = 10
                Add point... 'sample' 210.514038877
            elsif samplenum = 11
                Add point... 'sample' 210.080268897
            elsif samplenum = 12
                Add point... 'sample' 209.315100761
            elsif samplenum = 13
                Add point... 'sample' 208.480508997
            elsif samplenum = 14
                Add point... 'sample' 207.943172169
            elsif samplenum = 15
                Add point... 'sample' 207.60614639
            elsif samplenum = 16
                Add point... 'sample' 206.383875107
            elsif samplenum = 17
                Add point... 'sample' 205.228020668
            elsif samplenum = 18
                Add point... 'sample' 204.440664646
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9776
		Add point... 'beforeintervalend' 0.9776
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 211.953842424
            elsif samplenum = 4
                Add point... 'sample' 210.123177938
            elsif samplenum = 5
                Add point... 'sample' 210.52089804
            elsif samplenum = 6
                Add point... 'sample' 214.271444618
            elsif samplenum = 7
                Add point... 'sample' 223.13069207
            elsif samplenum = 8
                Add point... 'sample' 230.723912456
            elsif samplenum = 9
                Add point... 'sample' 236.981306786
            elsif samplenum = 10
                Add point... 'sample' 243.846546609
            elsif samplenum = 11
                Add point... 'sample' 248.401405548
            elsif samplenum = 12
                Add point... 'sample' 251.564652736
            elsif samplenum = 13
                Add point... 'sample' 253.597135152
            elsif samplenum = 14
                Add point... 'sample' 256.5384792
            elsif samplenum = 15
                Add point... 'sample' 259.775464943
            elsif samplenum = 16
                Add point... 'sample' 262.552844548
            elsif samplenum = 17
                Add point... 'sample' 263.278358291
            elsif samplenum = 18
                Add point... 'sample' 261.763868223
            elsif samplenum = 19
                Add point... 'sample' 259.080010975
            elsif samplenum = 20
                Add point... 'sample' 242.739104848
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.989
		Add point... 'beforeintervalend' 0.989
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 228.630827616
            elsif samplenum = 4
                Add point... 'sample' 219.440710534
            elsif samplenum = 5
                Add point... 'sample' 209.346587029
            elsif samplenum = 6
                Add point... 'sample' 203.214702112
            elsif samplenum = 7
                Add point... 'sample' 201.36806125
            elsif samplenum = 8
                Add point... 'sample' 198.539010496
            elsif samplenum = 9
                Add point... 'sample' 196.550223882
            elsif samplenum = 10
                Add point... 'sample' 196.043977801
            elsif samplenum = 11
                Add point... 'sample' 196.627855356
            elsif samplenum = 12
                Add point... 'sample' 198.728460127
            elsif samplenum = 13
                Add point... 'sample' 201.763661631
            elsif samplenum = 14
                Add point... 'sample' 205.286204779
            elsif samplenum = 15
                Add point... 'sample' 209.717448263
            elsif samplenum = 16
                Add point... 'sample' 215.978651053
            elsif samplenum = 17
                Add point... 'sample' 222.419862136
            elsif samplenum = 18
                Add point... 'sample' 223.841890007
            elsif samplenum = 19
                Add point... 'sample' 225.573081063
            elsif samplenum = 20
                Add point... 'sample' 226.390104167
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.062
		Add point... 'beforeintervalend' 1.062
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation
	endif
endfor




#### SIXTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-6"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 260.125400606
            elsif samplenum = 6
                Add point... 'sample' 257.272639951
            elsif samplenum = 7
                Add point... 'sample' 257.105683288
            elsif samplenum = 8
                Add point... 'sample' 256.219672466
            elsif samplenum = 9
                Add point... 'sample' 255.989544127
            elsif samplenum = 10
                Add point... 'sample' 255.594885428
            elsif samplenum = 11
                Add point... 'sample' 255.726789556
            elsif samplenum = 12
                Add point... 'sample' 255.874211704
            elsif samplenum = 13
                Add point... 'sample' 255.674650159
            elsif samplenum = 14
                Add point... 'sample' 255.490116057
            elsif samplenum = 15
                Add point... 'sample' 254.718932161
            elsif samplenum = 16
                Add point... 'sample' 253.828911848
            elsif samplenum = 17
                Add point... 'sample' 250.98984857
            elsif samplenum = 18
                Add point... 'sample' 246.001258075
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9213
		Add point... 'beforeintervalend' 0.913
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 232.456870979
            elsif samplenum = 4
                Add point... 'sample' 240.519598819
            elsif samplenum = 5
                Add point... 'sample' 248.205164973
            elsif samplenum = 6
                Add point... 'sample' 259.632198692
            elsif samplenum = 7
                Add point... 'sample' 271.656522378
            elsif samplenum = 8
                Add point... 'sample' 280.334191315
            elsif samplenum = 9
                Add point... 'sample' 290.957537002
            elsif samplenum = 10
                Add point... 'sample' 302.288783408
            elsif samplenum = 11
                Add point... 'sample' 310.248450545
            elsif samplenum = 12
                Add point... 'sample' 311.096978117
            elsif samplenum = 13
                Add point... 'sample' 306.191374322
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.7545
		Add point... 'beforeintervalend' 0.7545
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 231.203395972
            elsif samplenum = 6
                Add point... 'sample' 227.56106604
            elsif samplenum = 7
                Add point... 'sample' 223.776937554
            elsif samplenum = 8
                Add point... 'sample' 220.737630873
            elsif samplenum = 9
                Add point... 'sample' 218.19567445
            elsif samplenum = 10
                Add point... 'sample' 215.643271616
            elsif samplenum = 11
                Add point... 'sample' 211.444258806
            elsif samplenum = 12
                Add point... 'sample' 205.484118475
            elsif samplenum = 13
                Add point... 'sample' 200.414068615
            elsif samplenum = 14
                Add point... 'sample' 196.648194987
            elsif samplenum = 15
                Add point... 'sample' 197.138704773
            elsif samplenum = 16
                Add point... 'sample' 194.063086797
            elsif samplenum = 17
                Add point... 'sample' 194.694761472
            elsif samplenum = 18
                Add point... 'sample' 193.975936364
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9057
		Add point... 'beforeintervalend' 0.9057
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 5 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 209.390829187
            elsif samplenum = 6
                Add point... 'sample' 208.597203931
            elsif samplenum = 7
                Add point... 'sample' 208.557749784
            elsif samplenum = 8
                Add point... 'sample' 208.238434706
            elsif samplenum = 9
                Add point... 'sample' 208.872720206
            elsif samplenum = 10
                Add point... 'sample' 208.455297331
            elsif samplenum = 11
                Add point... 'sample' 208.04049783
            elsif samplenum = 12
                Add point... 'sample' 207.322039242
            elsif samplenum = 13
                Add point... 'sample' 206.566797322
            elsif samplenum = 14
                Add point... 'sample' 206.095178847
            elsif samplenum = 15
                Add point... 'sample' 205.82312012
            elsif samplenum = 16
                Add point... 'sample' 204.750459832
            elsif samplenum = 17
                Add point... 'sample' 203.737400028
            elsif samplenum = 18
                Add point... 'sample' 203.16295303
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9808
		Add point... 'beforeintervalend' 0.9808
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 209.417786364
            elsif samplenum = 4
                Add point... 'sample' 207.938586447
            elsif samplenum = 5
                Add point... 'sample' 208.277124294
            elsif samplenum = 6
                Add point... 'sample' 211.532592729
            elsif samplenum = 7
                Add point... 'sample' 219.571015087
            elsif samplenum = 8
                Add point... 'sample' 225.71244457
            elsif samplenum = 9
                Add point... 'sample' 230.994606596
            elsif samplenum = 10
                Add point... 'sample' 237.101921356
            elsif samplenum = 11
                Add point... 'sample' 240.56396631
            elsif samplenum = 12
                Add point... 'sample' 243.14672674
            elsif samplenum = 13
                Add point... 'sample' 244.893104856
            elsif samplenum = 14
                Add point... 'sample' 247.476512236
            elsif samplenum = 15
                Add point... 'sample' 250.188304418
            elsif samplenum = 16
                Add point... 'sample' 252.499393966
            elsif samplenum = 17
                Add point... 'sample' 253.103621635
            elsif samplenum = 18
                Add point... 'sample' 251.839024686
            elsif samplenum = 19
                Add point... 'sample' 249.412510015
            elsif samplenum = 20
                Add point... 'sample' 235.125702727
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9906
		Add point... 'beforeintervalend' 0.9906
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 225.825140441
            elsif samplenum = 4
                Add point... 'sample' 217.633851058
            elsif samplenum = 5
                Add point... 'sample' 209.01668125
            elsif samplenum = 6
                Add point... 'sample' 204.051568219
            elsif samplenum = 7
                Add point... 'sample' 203.060803252
            elsif samplenum = 8
                Add point... 'sample' 200.688025949
            elsif samplenum = 9
                Add point... 'sample' 199.006491695
            elsif samplenum = 10
                Add point... 'sample' 198.887746556
            elsif samplenum = 11
                Add point... 'sample' 200.092452283
            elsif samplenum = 12
                Add point... 'sample' 202.7166156
            elsif samplenum = 13
                Add point... 'sample' 206.282479612
            elsif samplenum = 14
                Add point... 'sample' 210.276183915
            elsif samplenum = 15
                Add point... 'sample' 215.123559571
            elsif samplenum = 16
                Add point... 'sample' 221.500947149
            elsif samplenum = 17
                Add point... 'sample' 228.363053986
            elsif samplenum = 18
                Add point... 'sample' 230.414805236
            elsif samplenum = 19
                Add point... 'sample' 232.27758143
            elsif samplenum = 20
                Add point... 'sample' 233.873108333
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0532
		Add point... 'beforeintervalend' 1.0532
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation
	endif
endfor




#### SEVENTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-7"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 260.331672727
            elsif samplenum = 6
                Add point... 'sample' 257.294010163
            elsif samplenum = 7
                Add point... 'sample' 257.229183454
            elsif samplenum = 8
                Add point... 'sample' 256.523893046
            elsif samplenum = 9
                Add point... 'sample' 256.503865282
            elsif samplenum = 10
                Add point... 'sample' 256.352609787
            elsif samplenum = 11
                Add point... 'sample' 256.632816955
            elsif samplenum = 12
                Add point... 'sample' 256.891357122
            elsif samplenum = 13
                Add point... 'sample' 256.742063011
            elsif samplenum = 14
                Add point... 'sample' 256.591492601
            elsif samplenum = 15
                Add point... 'sample' 255.855547634
            elsif samplenum = 16
                Add point... 'sample' 254.97517517
            elsif samplenum = 17
                Add point... 'sample' 252.355022526
            elsif samplenum = 18
                Add point... 'sample' 247.98763369
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9344
		Add point... 'beforeintervalend' 0.9344
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 234.969525175
            elsif samplenum = 4
                Add point... 'sample' 241.992832349
            elsif samplenum = 5
                Add point... 'sample' 250.107364101
            elsif samplenum = 6
                Add point... 'sample' 262.411798694
            elsif samplenum = 7
                Add point... 'sample' 275.942173776
            elsif samplenum = 8
                Add point... 'sample' 286.568304514
            elsif samplenum = 9
                Add point... 'sample' 299.61637934
            elsif samplenum = 10
                Add point... 'sample' 313.304168191
            elsif samplenum = 11
                Add point... 'sample' 323.119767743
            elsif samplenum = 12
                Add point... 'sample' 324.98746022
            elsif samplenum = 13
                Add point... 'sample' 321.326473046
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.7954
		Add point... 'beforeintervalend' 0.7954
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
         while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 228.194096869
            elsif samplenum = 6
                Add point... 'sample' 224.55445717
            elsif samplenum = 7
                Add point... 'sample' 220.747369116
            elsif samplenum = 8
                Add point... 'sample' 217.725946667
            elsif samplenum = 9
                Add point... 'sample' 215.28032529
            elsif samplenum = 10
                Add point... 'sample' 212.867864167
            elsif samplenum = 11
                Add point... 'sample' 208.952985757
            elsif samplenum = 12
                Add point... 'sample' 203.443147234
            elsif samplenum = 13
                Add point... 'sample' 198.802442075
            elsif samplenum = 14
                Add point... 'sample' 195.286399791
            elsif samplenum = 15
                Add point... 'sample' 196.074064394
            elsif samplenum = 16
                Add point... 'sample' 192.838758442
            elsif samplenum = 17
                Add point... 'sample' 193.413662338
            elsif samplenum = 18
                Add point... 'sample' 192.755630303
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9214
		Add point... 'beforeintervalend' 0.9214
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 207.548855024
            elsif samplenum = 6
                Add point... 'sample' 206.578612285
            elsif samplenum = 7
                Add point... 'sample' 206.65482482
            elsif samplenum = 8
                Add point... 'sample' 206.207915072
            elsif samplenum = 9
                Add point... 'sample' 206.889512452
            elsif samplenum = 10
                Add point... 'sample' 206.396555784
            elsif samplenum = 11
                Add point... 'sample' 206.000726763
            elsif samplenum = 12
                Add point... 'sample' 205.328977723
            elsif samplenum = 13
                Add point... 'sample' 204.653085647
            elsif samplenum = 14
                Add point... 'sample' 204.247185526
            elsif samplenum = 15
                Add point... 'sample' 204.04009385
            elsif samplenum = 16
                Add point... 'sample' 203.117044557
            elsif samplenum = 17
                Add point... 'sample' 202.246779388
            elsif samplenum = 18
                Add point... 'sample' 201.885241414
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.934
		Add point... 'beforeintervalend' 0.934
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 206.881730303
            elsif samplenum = 4
                Add point... 'sample' 205.753994956
            elsif samplenum = 5
                Add point... 'sample' 206.033350548
            elsif samplenum = 6
                Add point... 'sample' 208.79374084
            elsif samplenum = 7
                Add point... 'sample' 216.011338104
            elsif samplenum = 8
                Add point... 'sample' 220.700976684
            elsif samplenum = 9
                Add point... 'sample' 225.007906406
            elsif samplenum = 10
                Add point... 'sample' 230.357296104
            elsif samplenum = 11
                Add point... 'sample' 232.726527072
            elsif samplenum = 12
                Add point... 'sample' 234.728800745
            elsif samplenum = 13
                Add point... 'sample' 236.189074559
            elsif samplenum = 14
                Add point... 'sample' 238.414545271
            elsif samplenum = 15
                Add point... 'sample' 240.601143894
            elsif samplenum = 16
                Add point... 'sample' 242.445943385
            elsif samplenum = 17
                Add point... 'sample' 242.928884978
            elsif samplenum = 18
                Add point... 'sample' 241.914181149
            elsif samplenum = 19
                Add point... 'sample' 239.745009055
            elsif samplenum = 20
                Add point... 'sample' 227.512300606
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9921
		Add point... 'beforeintervalend' 0.9921
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 223.019453266
            elsif samplenum = 4
                Add point... 'sample' 215.826991582
            elsif samplenum = 5
                Add point... 'sample' 208.686775471
            elsif samplenum = 6
                Add point... 'sample' 204.888434327
            elsif samplenum = 7
                Add point... 'sample' 204.753545254
            elsif samplenum = 8
                Add point... 'sample' 202.837041402
            elsif samplenum = 9
                Add point... 'sample' 201.462759508
            elsif samplenum = 10
                Add point... 'sample' 201.731515312
            elsif samplenum = 11
                Add point... 'sample' 203.55704921
            elsif samplenum = 12
                Add point... 'sample' 206.704771073
            elsif samplenum = 13
                Add point... 'sample' 210.801297594
            elsif samplenum = 14
                Add point... 'sample' 215.266163051
            elsif samplenum = 15
                Add point... 'sample' 220.529670879
            elsif samplenum = 16
                Add point... 'sample' 227.023243246
            elsif samplenum = 17
                Add point... 'sample' 234.306245836
            elsif samplenum = 18
                Add point... 'sample' 236.987720465
            elsif samplenum = 19
                Add point... 'sample' 238.982081798
            elsif samplenum = 20
                Add point... 'sample' 241.3561125
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0443
		Add point... 'beforeintervalend' 1.0443
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### EIGHTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-8"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 260.537944848
            elsif samplenum = 6
                Add point... 'sample' 257.315380375
            elsif samplenum = 7
                Add point... 'sample' 257.35268362
            elsif samplenum = 8
                Add point... 'sample' 256.828113626
            elsif samplenum = 9
                Add point... 'sample' 257.018186436
            elsif samplenum = 10
                Add point... 'sample' 257.110334145
            elsif samplenum = 11
                Add point... 'sample' 257.538844353
            elsif samplenum = 12
                Add point... 'sample' 257.90850254
            elsif samplenum = 13
                Add point... 'sample' 257.809475864
            elsif samplenum = 14
                Add point... 'sample' 257.692869146
            elsif samplenum = 15
                Add point... 'sample' 256.992163107
            elsif samplenum = 16
                Add point... 'sample' 256.121438493
            elsif samplenum = 17
                Add point... 'sample' 253.720196482
            elsif samplenum = 18
                Add point... 'sample' 249.974009305
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9475
		Add point... 'beforeintervalend' 0.9475
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 237.482179371
            elsif samplenum = 4
                Add point... 'sample' 243.46606588
            elsif samplenum = 5
                Add point... 'sample' 252.009563229
            elsif samplenum = 6
                Add point... 'sample' 265.191398695
            elsif samplenum = 7
                Add point... 'sample' 280.227825175
            elsif samplenum = 8
                Add point... 'sample' 292.802417714
            elsif samplenum = 9
                Add point... 'sample' 308.275221677
            elsif samplenum = 10
                Add point... 'sample' 324.319552974
            elsif samplenum = 11
                Add point... 'sample' 335.991084941
            elsif samplenum = 12
                Add point... 'sample' 338.877942322
            elsif samplenum = 13
                Add point... 'sample' 336.46157177
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8363
		Add point... 'beforeintervalend' 0.8363
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 225.184797765
            elsif samplenum = 6
                Add point... 'sample' 221.5478483
            elsif samplenum = 7
                Add point... 'sample' 217.717800677
            elsif samplenum = 8
                Add point... 'sample' 214.714262462
            elsif samplenum = 9
                Add point... 'sample' 212.364976129
            elsif samplenum = 10
                Add point... 'sample' 210.092456719
            elsif samplenum = 11
                Add point... 'sample' 206.461712708
            elsif samplenum = 12
                Add point... 'sample' 201.402175992
            elsif samplenum = 13
                Add point... 'sample' 197.190815535
            elsif samplenum = 14
                Add point... 'sample' 193.924604594
            elsif samplenum = 15
                Add point... 'sample' 195.009424015
            elsif samplenum = 16
                Add point... 'sample' 191.614430087
            elsif samplenum = 17
                Add point... 'sample' 192.132563203
            elsif samplenum = 18
                Add point... 'sample' 191.535324242
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9371
		Add point... 'beforeintervalend' 0.9371
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 205.706880861
            elsif samplenum = 6
                Add point... 'sample' 204.560020639
            elsif samplenum = 7
                Add point... 'sample' 204.751899856
            elsif samplenum = 8
                Add point... 'sample' 204.177395438
            elsif samplenum = 9
                Add point... 'sample' 204.906304699
            elsif samplenum = 10
                Add point... 'sample' 204.337814238
            elsif samplenum = 11
                Add point... 'sample' 203.960955696
            elsif samplenum = 12
                Add point... 'sample' 203.335916205
            elsif samplenum = 13
                Add point... 'sample' 202.739373972
            elsif samplenum = 14
                Add point... 'sample' 202.399192205
            elsif samplenum = 15
                Add point... 'sample' 202.25706758
            elsif samplenum = 16
                Add point... 'sample' 201.483629282
            elsif samplenum = 17
                Add point... 'sample' 200.756158749
            elsif samplenum = 18
                Add point... 'sample' 200.607529798
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9872
		Add point... 'beforeintervalend' 0.9872
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 204.345674242
            elsif samplenum = 4
                Add point... 'sample' 203.569403465
            elsif samplenum = 5
                Add point... 'sample' 203.789576802
            elsif samplenum = 6
                Add point... 'sample' 206.054888951
            elsif samplenum = 7
                Add point... 'sample' 212.451661122
            elsif samplenum = 8
                Add point... 'sample' 215.689508799
            elsif samplenum = 9
                Add point... 'sample' 219.021206216
            elsif samplenum = 10
                Add point... 'sample' 223.612670851
            elsif samplenum = 11
                Add point... 'sample' 224.889087834
            elsif samplenum = 12
                Add point... 'sample' 226.31087475
            elsif samplenum = 13
                Add point... 'sample' 227.485044263
            elsif samplenum = 14
                Add point... 'sample' 229.352578306
            elsif samplenum = 15
                Add point... 'sample' 231.013983369
            elsif samplenum = 16
                Add point... 'sample' 232.392492803
            elsif samplenum = 17
                Add point... 'sample' 232.754148322
            elsif samplenum = 18
                Add point... 'sample' 231.989337611
            elsif samplenum = 19
                Add point... 'sample' 230.077508095
            elsif samplenum = 20
                Add point... 'sample' 219.898898485
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9937
		Add point... 'beforeintervalend' 0.9937
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 220.213766091
            elsif samplenum = 4
                Add point... 'sample' 214.020132106
            elsif samplenum = 5
                Add point... 'sample' 208.356869692
            elsif samplenum = 6
                Add point... 'sample' 205.725300434
            elsif samplenum = 7
                Add point... 'sample' 206.446287256
            elsif samplenum = 8
                Add point... 'sample' 204.986056855
            elsif samplenum = 9
                Add point... 'sample' 203.919027321
            elsif samplenum = 10
                Add point... 'sample' 204.575284068
            elsif samplenum = 11
                Add point... 'sample' 207.021646137
            elsif samplenum = 12
                Add point... 'sample' 210.692926546
            elsif samplenum = 13
                Add point... 'sample' 215.320115575
            elsif samplenum = 14
                Add point... 'sample' 220.256142187
            elsif samplenum = 15
                Add point... 'sample' 225.935782187
            elsif samplenum = 16
                Add point... 'sample' 232.545539343
            elsif samplenum = 17
                Add point... 'sample' 240.249437686
            elsif samplenum = 18
                Add point... 'sample' 243.560635694
            elsif samplenum = 19
                Add point... 'sample' 245.686582166
            elsif samplenum = 20
                Add point... 'sample' 248.839116667
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0355
		Add point... 'beforeintervalend' 1.0355
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### NINTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-9"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 260.74421697
            elsif samplenum = 6
                Add point... 'sample' 257.336750588
            elsif samplenum = 7
                Add point... 'sample' 257.476183787
            elsif samplenum = 8
                Add point... 'sample' 257.132334206
            elsif samplenum = 9
                Add point... 'sample' 257.53250759
            elsif samplenum = 10
                Add point... 'sample' 257.868058504
            elsif samplenum = 11
                Add point... 'sample' 258.444871752
            elsif samplenum = 12
                Add point... 'sample' 258.925647957
            elsif samplenum = 13
                Add point... 'sample' 258.876888716
            elsif samplenum = 14
                Add point... 'sample' 258.794245691
            elsif samplenum = 15
                Add point... 'sample' 258.12877858
            elsif samplenum = 16
                Add point... 'sample' 257.267701815
            elsif samplenum = 17
                Add point... 'sample' 255.085370439
            elsif samplenum = 18
                Add point... 'sample' 251.96038492
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9607
		Add point... 'beforeintervalend' 0.9607
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 239.994833566
            elsif samplenum = 4
                Add point... 'sample' 244.93929941
            elsif samplenum = 5
                Add point... 'sample' 253.911762357
            elsif samplenum = 6
                Add point... 'sample' 267.970998697
            elsif samplenum = 7
                Add point... 'sample' 284.513476573
            elsif samplenum = 8
                Add point... 'sample' 299.036530914
            elsif samplenum = 9
                Add point... 'sample' 316.934064014
            elsif samplenum = 10
                Add point... 'sample' 335.334937757
            elsif samplenum = 11
                Add point... 'sample' 348.862402138
            elsif samplenum = 12
                Add point... 'sample' 352.768424425
            elsif samplenum = 13
                Add point... 'sample' 351.596670494
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.8773
		Add point... 'beforeintervalend' 0.8773
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 222.175498662
            elsif samplenum = 6
                Add point... 'sample' 218.54123943
            elsif samplenum = 7
                Add point... 'sample' 214.688232239
            elsif samplenum = 8
                Add point... 'sample' 211.702578257
            elsif samplenum = 9
                Add point... 'sample' 209.449626969
            elsif samplenum = 10
                Add point... 'sample' 207.31704927
            elsif samplenum = 11
                Add point... 'sample' 203.970439659
            elsif samplenum = 12
                Add point... 'sample' 199.361204751
            elsif samplenum = 13
                Add point... 'sample' 195.579188995
            elsif samplenum = 14
                Add point... 'sample' 192.562809398
            elsif samplenum = 15
                Add point... 'sample' 193.944783636
            elsif samplenum = 16
                Add point... 'sample' 190.390101732
            elsif samplenum = 17
                Add point... 'sample' 190.851464069
            elsif samplenum = 18
                Add point... 'sample' 190.315018182
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9528
		Add point... 'beforeintervalend' 0.9528
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 203.864906699
            elsif samplenum = 6
                Add point... 'sample' 202.541428993
            elsif samplenum = 7
                Add point... 'sample' 202.848974892
            elsif samplenum = 8
                Add point... 'sample' 202.146875804
            elsif samplenum = 9
                Add point... 'sample' 202.923096945
            elsif samplenum = 10
                Add point... 'sample' 202.279072691
            elsif samplenum = 11
                Add point... 'sample' 201.921184629
            elsif samplenum = 12
                Add point... 'sample' 201.342854686
            elsif samplenum = 13
                Add point... 'sample' 200.825662297
            elsif samplenum = 14
                Add point... 'sample' 200.551198883
            elsif samplenum = 15
                Add point... 'sample' 200.47404131
            elsif samplenum = 16
                Add point... 'sample' 199.850214007
            elsif samplenum = 17
                Add point... 'sample' 199.265538109
            elsif samplenum = 18
                Add point... 'sample' 199.329818182
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9904
		Add point... 'beforeintervalend' 0.9904
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 201.809618182
            elsif samplenum = 4
                Add point... 'sample' 201.384811973
            elsif samplenum = 5
                Add point... 'sample' 201.545803056
            elsif samplenum = 6
                Add point... 'sample' 203.316037062
            elsif samplenum = 7
                Add point... 'sample' 208.891984139
            elsif samplenum = 8
                Add point... 'sample' 210.678040913
            elsif samplenum = 9
                Add point... 'sample' 213.034506025
            elsif samplenum = 10
                Add point... 'sample' 216.868045599
            elsif samplenum = 11
                Add point... 'sample' 217.051648596
            elsif samplenum = 12
                Add point... 'sample' 217.892948755
            elsif samplenum = 13
                Add point... 'sample' 218.781013966
            elsif samplenum = 14
                Add point... 'sample' 220.290611342
            elsif samplenum = 15
                Add point... 'sample' 221.426822844
            elsif samplenum = 16
                Add point... 'sample' 222.339042221
            elsif samplenum = 17
                Add point... 'sample' 222.579411665
            elsif samplenum = 18
                Add point... 'sample' 222.064494074
            elsif samplenum = 19
                Add point... 'sample' 220.410007135
            elsif samplenum = 20
                Add point... 'sample' 212.285496364
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9953
		Add point... 'beforeintervalend' 0.9953
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 217.408078916
            elsif samplenum = 4
                Add point... 'sample' 212.213272631
            elsif samplenum = 5
                Add point... 'sample' 208.026963913
            elsif samplenum = 6
                Add point... 'sample' 206.562166542
            elsif samplenum = 7
                Add point... 'sample' 208.139029258
            elsif samplenum = 8
                Add point... 'sample' 207.135072308
            elsif samplenum = 9
                Add point... 'sample' 206.375295133
            elsif samplenum = 10
                Add point... 'sample' 207.419052824
            elsif samplenum = 11
                Add point... 'sample' 210.486243065
            elsif samplenum = 12
                Add point... 'sample' 214.681082019
            elsif samplenum = 13
                Add point... 'sample' 219.838933556
            elsif samplenum = 14
                Add point... 'sample' 225.246121322
            elsif samplenum = 15
                Add point... 'sample' 231.341893495
            elsif samplenum = 16
                Add point... 'sample' 238.067835439
            elsif samplenum = 17
                Add point... 'sample' 246.192629535
            elsif samplenum = 18
                Add point... 'sample' 250.133550923
            elsif samplenum = 19
                Add point... 'sample' 252.391082533
            elsif samplenum = 20
                Add point... 'sample' 256.322120833
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0266
		Add point... 'beforeintervalend' 1.0266
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### TENTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-10"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 260.950489091
            elsif samplenum = 6
                Add point... 'sample' 257.3581208
            elsif samplenum = 7
                Add point... 'sample' 257.599683953
            elsif samplenum = 8
                Add point... 'sample' 257.436554786
            elsif samplenum = 9
                Add point... 'sample' 258.046828744
            elsif samplenum = 10
                Add point... 'sample' 258.625782862
            elsif samplenum = 11
                Add point... 'sample' 259.35089915
            elsif samplenum = 12
                Add point... 'sample' 259.942793375
            elsif samplenum = 13
                Add point... 'sample' 259.944301568
            elsif samplenum = 14
                Add point... 'sample' 259.895622235
            elsif samplenum = 15
                Add point... 'sample' 259.265394054
            elsif samplenum = 16
                Add point... 'sample' 258.413965137
            elsif samplenum = 17
                Add point... 'sample' 256.450544395
            elsif samplenum = 18
                Add point... 'sample' 253.946760535
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9738
		Add point... 'beforeintervalend' 0.9738
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 242.507487762
            elsif samplenum = 4
                Add point... 'sample' 246.41253294
            elsif samplenum = 5
                Add point... 'sample' 255.813961484
            elsif samplenum = 6
                Add point... 'sample' 270.750598698
            elsif samplenum = 7
                Add point... 'sample' 288.799127972
            elsif samplenum = 8
                Add point... 'sample' 305.270644113
            elsif samplenum = 9
                Add point... 'sample' 325.592906351
            elsif samplenum = 10
                Add point... 'sample' 346.35032254
            elsif samplenum = 11
                Add point... 'sample' 361.733719336
            elsif samplenum = 12
                Add point... 'sample' 366.658906527
            elsif samplenum = 13
                Add point... 'sample' 366.731769219
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9182
		Add point... 'beforeintervalend' 0.9182
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 219.166199558
            elsif samplenum = 6
                Add point... 'sample' 215.53463056
            elsif samplenum = 7
                Add point... 'sample' 211.6586638
            elsif samplenum = 8
                Add point... 'sample' 208.690894052
            elsif samplenum = 9
                Add point... 'sample' 206.534277808
            elsif samplenum = 10
                Add point... 'sample' 204.541641821
            elsif samplenum = 11
                Add point... 'sample' 201.479166611
            elsif samplenum = 12
                Add point... 'sample' 197.320233509
            elsif samplenum = 13
                Add point... 'sample' 193.967562455
            elsif samplenum = 14
                Add point... 'sample' 191.201014202
            elsif samplenum = 15
                Add point... 'sample' 192.880143258
            elsif samplenum = 16
                Add point... 'sample' 189.165773377
            elsif samplenum = 17
                Add point... 'sample' 189.570364935
            elsif samplenum = 18
                Add point... 'sample' 189.094712121
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9686
		Add point... 'beforeintervalend' 0.9686
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 202.022932536
            elsif samplenum = 6
                Add point... 'sample' 200.522837346
            elsif samplenum = 7
                Add point... 'sample' 200.946049928
            elsif samplenum = 8
                Add point... 'sample' 200.11635617
            elsif samplenum = 9
                Add point... 'sample' 200.939889192
            elsif samplenum = 10
                Add point... 'sample' 200.220331145
            elsif samplenum = 11
                Add point... 'sample' 199.881413562
            elsif samplenum = 12
                Add point... 'sample' 199.349793167
            elsif samplenum = 13
                Add point... 'sample' 198.911950622
            elsif samplenum = 14
                Add point... 'sample' 198.703205562
            elsif samplenum = 15
                Add point... 'sample' 198.69101504
            elsif samplenum = 16
                Add point... 'sample' 198.216798732
            elsif samplenum = 17
                Add point... 'sample' 197.77491747
            elsif samplenum = 18
                Add point... 'sample' 198.052106566
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9936
		Add point... 'beforeintervalend' 0.9936
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 199.273562121
            elsif samplenum = 4
                Add point... 'sample' 199.200220482
            elsif samplenum = 5
                Add point... 'sample' 199.30202931
            elsif samplenum = 6
                Add point... 'sample' 200.577185173
            elsif samplenum = 7
                Add point... 'sample' 205.332307157
            elsif samplenum = 8
                Add point... 'sample' 205.666573027
            elsif samplenum = 9
                Add point... 'sample' 207.047805835
            elsif samplenum = 10
                Add point... 'sample' 210.123420346
            elsif samplenum = 11
                Add point... 'sample' 209.214209358
            elsif samplenum = 12
                Add point... 'sample' 209.47502276
            elsif samplenum = 13
                Add point... 'sample' 210.07698367
            elsif samplenum = 14
                Add point... 'sample' 211.228644377
            elsif samplenum = 15
                Add point... 'sample' 211.839662319
            elsif samplenum = 16
                Add point... 'sample' 212.28559164
            elsif samplenum = 17
                Add point... 'sample' 212.404675008
            elsif samplenum = 18
                Add point... 'sample' 212.139650536
            elsif samplenum = 19
                Add point... 'sample' 210.742506175
            elsif samplenum = 20
                Add point... 'sample' 204.672094242
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9969
		Add point... 'beforeintervalend' 0.9969
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 214.602391741
            elsif samplenum = 4
                Add point... 'sample' 210.406413155
            elsif samplenum = 5
                Add point... 'sample' 207.697058133
            elsif samplenum = 6
                Add point... 'sample' 207.39903265
            elsif samplenum = 7
                Add point... 'sample' 209.83177126
            elsif samplenum = 8
                Add point... 'sample' 209.284087761
            elsif samplenum = 9
                Add point... 'sample' 208.831562946
            elsif samplenum = 10
                Add point... 'sample' 210.262821579
            elsif samplenum = 11
                Add point... 'sample' 213.950839992
            elsif samplenum = 12
                Add point... 'sample' 218.669237492
            elsif samplenum = 13
                Add point... 'sample' 224.357751537
            elsif samplenum = 14
                Add point... 'sample' 230.236100458
            elsif samplenum = 15
                Add point... 'sample' 236.748004803
            elsif samplenum = 16
                Add point... 'sample' 243.590131536
            elsif samplenum = 17
                Add point... 'sample' 252.135821385
            elsif samplenum = 18
                Add point... 'sample' 256.706466152
            elsif samplenum = 19
                Add point... 'sample' 259.095582901
            elsif samplenum = 20
                Add point... 'sample' 263.805125
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0177
		Add point... 'beforeintervalend' 1.0177
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### ELEVENTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-11"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 261.156761212
            elsif samplenum = 6
                Add point... 'sample' 257.379491012
            elsif samplenum = 7
                Add point... 'sample' 257.723184119
            elsif samplenum = 8
                Add point... 'sample' 257.740775366
            elsif samplenum = 9
                Add point... 'sample' 258.561149898
            elsif samplenum = 10
                Add point... 'sample' 259.383507221
            elsif samplenum = 11
                Add point... 'sample' 260.256926549
            elsif samplenum = 12
                Add point... 'sample' 260.959938793
            elsif samplenum = 13
                Add point... 'sample' 261.01171442
            elsif samplenum = 14
                Add point... 'sample' 260.99699878
            elsif samplenum = 15
                Add point... 'sample' 260.402009527
            elsif samplenum = 16
                Add point... 'sample' 259.560228459
            elsif samplenum = 17
                Add point... 'sample' 257.815718351
            elsif samplenum = 18
                Add point... 'sample' 255.93313615
            endif
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9869
		Add point... 'beforeintervalend' 0.9869
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 245.020141958
            elsif samplenum = 4
                Add point... 'sample' 247.88576647
            elsif samplenum = 5
                Add point... 'sample' 257.716160612
            elsif samplenum = 6
                Add point... 'sample' 273.5301987
            elsif samplenum = 7
                Add point... 'sample' 293.084779371
            elsif samplenum = 8
                Add point... 'sample' 311.504757313
            elsif samplenum = 9
                Add point... 'sample' 334.251748688
            elsif samplenum = 10
                Add point... 'sample' 357.365707322
            elsif samplenum = 11
                Add point... 'sample' 374.605036534
            elsif samplenum = 12
                Add point... 'sample' 380.549388629
            elsif samplenum = 13
                Add point... 'sample' 381.866867943
            endif
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9591
		Add point... 'beforeintervalend' 0.9591
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 216.156900455
            elsif samplenum = 6
                Add point... 'sample' 212.52802169
            elsif samplenum = 7
                Add point... 'sample' 208.629095362
            elsif samplenum = 8
                Add point... 'sample' 205.679209846
            elsif samplenum = 9
                Add point... 'sample' 203.618928648
            elsif samplenum = 10
                Add point... 'sample' 201.766234372
            elsif samplenum = 11
                Add point... 'sample' 198.987893562
            elsif samplenum = 12
                Add point... 'sample' 195.279262267
            elsif samplenum = 13
                Add point... 'sample' 192.355935915
            elsif samplenum = 14
                Add point... 'sample' 189.839219006
            elsif samplenum = 15
                Add point... 'sample' 191.815502879
            elsif samplenum = 16
                Add point... 'sample' 187.941445022
            elsif samplenum = 17
                Add point... 'sample' 188.289265801
            elsif samplenum = 18
                Add point... 'sample' 187.874406061
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9843
		Add point... 'beforeintervalend' 0.9843
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 200.180958373
            elsif samplenum = 6
                Add point... 'sample' 198.5042457
            elsif samplenum = 7
                Add point... 'sample' 199.043124964
            elsif samplenum = 8
                Add point... 'sample' 198.085836536
            elsif samplenum = 9
                Add point... 'sample' 198.956681438
            elsif samplenum = 10
                Add point... 'sample' 198.161589598
            elsif samplenum = 11
                Add point... 'sample' 197.841642495
            elsif samplenum = 12
                Add point... 'sample' 197.356731649
            elsif samplenum = 13
                Add point... 'sample' 196.998238948
            elsif samplenum = 14
                Add point... 'sample' 196.85521224
            elsif samplenum = 15
                Add point... 'sample' 196.90798877
            elsif samplenum = 16
                Add point... 'sample' 196.583383457
            elsif samplenum = 17
                Add point... 'sample' 196.28429683
            elsif samplenum = 18
                Add point... 'sample' 196.774394949
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9968
		Add point... 'beforeintervalend' 0.9968
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 196.737506061
            elsif samplenum = 4
                Add point... 'sample' 197.015628991
            elsif samplenum = 5
                Add point... 'sample' 197.058255564
            elsif samplenum = 6
                Add point... 'sample' 197.838333284
            elsif samplenum = 7
                Add point... 'sample' 201.772630174
            elsif samplenum = 8
                Add point... 'sample' 200.655105141
            elsif samplenum = 9
                Add point... 'sample' 201.061105645
            elsif samplenum = 10
                Add point... 'sample' 203.378795094
            elsif samplenum = 11
                Add point... 'sample' 201.37677012
            elsif samplenum = 12
                Add point... 'sample' 201.057096764
            elsif samplenum = 13
                Add point... 'sample' 201.372953373
            elsif samplenum = 14
                Add point... 'sample' 202.166677412
            elsif samplenum = 15
                Add point... 'sample' 202.252501795
            elsif samplenum = 16
                Add point... 'sample' 202.232141058
            elsif samplenum = 17
                Add point... 'sample' 202.229938352
            elsif samplenum = 18
                Add point... 'sample' 202.214806999
            elsif samplenum = 19
                Add point... 'sample' 201.075005215
            elsif samplenum = 20
                Add point... 'sample' 197.058692121
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9984
		Add point... 'beforeintervalend' 0.984
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 211.796704566
            elsif samplenum = 4
                Add point... 'sample' 208.599553679
            elsif samplenum = 5
                Add point... 'sample' 207.367152354
            elsif samplenum = 6
                Add point... 'sample' 208.235898757
            elsif samplenum = 7
                Add point... 'sample' 211.524513261
            elsif samplenum = 8
                Add point... 'sample' 211.433103214
            elsif samplenum = 9
                Add point... 'sample' 211.287830759
            elsif samplenum = 10
                Add point... 'sample' 213.106590335
            elsif samplenum = 11
                Add point... 'sample' 217.415436919
            elsif samplenum = 12
                Add point... 'sample' 222.657392965
            elsif samplenum = 13
                Add point... 'sample' 228.876569519
            elsif samplenum = 14
                Add point... 'sample' 235.226079594
            elsif samplenum = 15
                Add point... 'sample' 242.154116111
            elsif samplenum = 16
                Add point... 'sample' 249.112427632
            elsif samplenum = 17
                Add point... 'sample' 258.079013235
            elsif samplenum = 18
                Add point... 'sample' 263.279381381
            elsif samplenum = 19
                Add point... 'sample' 265.800083269
            elsif samplenum = 20
                Add point... 'sample' 271.288129167
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0089
		Add point... 'beforeintervalend' 1.0089
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### TWELFTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-12"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 261.363033333
            elsif samplenum = 6
                Add point... 'sample' 257.400861224
            elsif samplenum = 7
                Add point... 'sample' 257.846684286
            elsif samplenum = 8
                Add point... 'sample' 258.044995946
            elsif samplenum = 9
                Add point... 'sample' 259.075471053
            elsif samplenum = 10
                Add point... 'sample' 260.141231579
            elsif samplenum = 11
                Add point... 'sample' 261.162953947
            elsif samplenum = 12
                Add point... 'sample' 261.977084211
            elsif samplenum = 13
                Add point... 'sample' 262.079127273
            elsif samplenum = 14
                Add point... 'sample' 262.098375325
            elsif samplenum = 15
                Add point... 'sample' 261.538625
            elsif samplenum = 16
                Add point... 'sample' 260.706491781
            elsif samplenum = 17
                Add point... 'sample' 259.180892308
            elsif samplenum = 18
                Add point... 'sample' 257.919511765
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1
		Add point... 'beforeintervalend' 1
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 247.532796154
            elsif samplenum = 4
                Add point... 'sample' 249.359
            elsif samplenum = 5
                Add point... 'sample' 259.61835974
            elsif samplenum = 6
                Add point... 'sample' 276.309798701
            elsif samplenum = 7
                Add point... 'sample' 297.370430769
            elsif samplenum = 8
                Add point... 'sample' 317.738870513
            elsif samplenum = 9
                Add point... 'sample' 342.910591026
            elsif samplenum = 10
                Add point... 'sample' 368.381092105
            elsif samplenum = 11
                Add point... 'sample' 387.476353731
            elsif samplenum = 12
                Add point... 'sample' 394.439870732
            elsif samplenum = 13
                Add point... 'sample' 397.001966667
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1
		Add point... 'beforeintervalend' 1
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 213.147601351
            elsif samplenum = 6
                Add point... 'sample' 209.521412821
            elsif samplenum = 7
                Add point... 'sample' 205.599526923
            elsif samplenum = 8
                Add point... 'sample' 202.667525641
            elsif samplenum = 9
                Add point... 'sample' 200.703579487
            elsif samplenum = 10
                Add point... 'sample' 198.990826923
            elsif samplenum = 11
                Add point... 'sample' 196.496620513
            elsif samplenum = 12
                Add point... 'sample' 193.238291026
            elsif samplenum = 13
                Add point... 'sample' 190.744309375
            elsif samplenum = 14
                Add point... 'sample' 188.47742381
            elsif samplenum = 15
                Add point... 'sample' 190.7508625
            elsif samplenum = 16
                Add point... 'sample' 186.717116667
            elsif samplenum = 17
                Add point... 'sample' 187.008166667
            elsif samplenum = 18
                Add point... 'sample' 186.6541
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1
		Add point... 'beforeintervalend' 1
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 198.338984211
            elsif samplenum = 6
                Add point... 'sample' 196.485654054
            elsif samplenum = 7
                Add point... 'sample' 197.1402
            elsif samplenum = 8
                Add point... 'sample' 196.055316901
            elsif samplenum = 9
                Add point... 'sample' 196.973473684
            elsif samplenum = 10
                Add point... 'sample' 196.102848052
            elsif samplenum = 11
                Add point... 'sample' 195.801871429
            elsif samplenum = 12
                Add point... 'sample' 195.36367013
            elsif samplenum = 13
                Add point... 'sample' 195.084527273
            elsif samplenum = 14
                Add point... 'sample' 195.007218919
            elsif samplenum = 15
                Add point... 'sample' 195.1249625
            elsif samplenum = 16
                Add point... 'sample' 194.949968182
            elsif samplenum = 17
                Add point... 'sample' 194.79367619
            elsif samplenum = 18
                Add point... 'sample' 195.496683333
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1
		Add point... 'beforeintervalend' 1
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 194.20145
            elsif samplenum = 4
                Add point... 'sample' 194.8310375
            elsif samplenum = 5
                Add point... 'sample' 194.814481818
            elsif samplenum = 6
                Add point... 'sample' 195.099481395
            elsif samplenum = 7
                Add point... 'sample' 198.212953191
            elsif samplenum = 8
                Add point... 'sample' 195.643637255
            elsif samplenum = 9
                Add point... 'sample' 195.074405455
            elsif samplenum = 10
                Add point... 'sample' 196.634169841
            elsif samplenum = 11
                Add point... 'sample' 193.539330882
            elsif samplenum = 12
                Add point... 'sample' 192.639170769
            elsif samplenum = 13
                Add point... 'sample' 192.668923077
            elsif samplenum = 14
                Add point... 'sample' 193.104710448
            elsif samplenum = 15
                Add point... 'sample' 192.66534127
            elsif samplenum = 16
                Add point... 'sample' 192.178690476
            elsif samplenum = 17
                Add point... 'sample' 192.055201695
            elsif samplenum = 18
                Add point... 'sample' 192.289963462
            elsif samplenum = 19
                Add point... 'sample' 191.407504255
            elsif samplenum = 20
                Add point... 'sample' 189.44529
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1
		Add point... 'beforeintervalend' 1
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 208.991017391
            elsif samplenum = 4
                Add point... 'sample' 206.792694203
            elsif samplenum = 5
                Add point... 'sample' 207.037246575
            elsif samplenum = 6
                Add point... 'sample' 209.072764865
            elsif samplenum = 7
                Add point... 'sample' 213.217255263
            elsif samplenum = 8
                Add point... 'sample' 213.582118667
            elsif samplenum = 9
                Add point... 'sample' 213.744098571
            elsif samplenum = 10
                Add point... 'sample' 215.950359091
            elsif samplenum = 11
                Add point... 'sample' 220.880033846
            elsif samplenum = 12
                Add point... 'sample' 226.645548437
            elsif samplenum = 13
                Add point... 'sample' 233.3953875
            elsif samplenum = 14
                Add point... 'sample' 240.21605873
            elsif samplenum = 15
                Add point... 'sample' 247.560227419
            elsif samplenum = 16
                Add point... 'sample' 254.634723729
            elsif samplenum = 17
                Add point... 'sample' 264.022205085
            elsif samplenum = 18
                Add point... 'sample' 269.85229661
            elsif samplenum = 19
                Add point... 'sample' 272.504583636
            elsif samplenum = 20
                Add point... 'sample' 278.771133333
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1
		Add point... 'beforeintervalend' 1
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### THIRTEENTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-13"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 261.569305455
            elsif samplenum = 6
                Add point... 'sample' 257.422231437
            elsif samplenum = 7
                Add point... 'sample' 257.970184452
            elsif samplenum = 8
                Add point... 'sample' 258.349216526
            elsif samplenum = 9
                Add point... 'sample' 259.589792207
            elsif samplenum = 10
                Add point... 'sample' 260.898955937
            elsif samplenum = 11
                Add point... 'sample' 262.068981346
            elsif samplenum = 12
                Add point... 'sample' 262.994229628
            elsif samplenum = 13
                Add point... 'sample' 263.146540125
            elsif samplenum = 14
                Add point... 'sample' 263.199751869
            elsif samplenum = 15
                Add point... 'sample' 262.675240473
            elsif samplenum = 16
                Add point... 'sample' 261.852755103
            elsif samplenum = 17
                Add point... 'sample' 260.546066264
            elsif samplenum = 18
                Add point... 'sample' 259.90588738
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0131
		Add point... 'beforeintervalend' 1.0131
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 250.04545035
            elsif samplenum = 4
                Add point... 'sample' 250.83223353
            elsif samplenum = 5
                Add point... 'sample' 261.520558868
            elsif samplenum = 6
                Add point... 'sample' 279.089398703
            elsif samplenum = 7
                Add point... 'sample' 301.656082168
            elsif samplenum = 8
                Add point... 'sample' 323.972983712
            elsif samplenum = 9
                Add point... 'sample' 351.569433363
            elsif samplenum = 10
                Add point... 'sample' 379.396476888
            elsif samplenum = 11
                Add point... 'sample' 400.347670929
            elsif samplenum = 12
                Add point... 'sample' 408.330352834
            elsif samplenum = 13
                Add point... 'sample' 412.137065391
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0409
		Add point... 'beforeintervalend' 1.0409
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 210.138302248
            elsif samplenum = 6
                Add point... 'sample' 206.514803951
            elsif samplenum = 7
                Add point... 'sample' 202.569958485
            elsif samplenum = 8
                Add point... 'sample' 199.655841436
            elsif samplenum = 9
                Add point... 'sample' 197.788230327
            elsif samplenum = 10
                Add point... 'sample' 196.215419474
            elsif samplenum = 11
                Add point... 'sample' 194.005347464
            elsif samplenum = 12
                Add point... 'sample' 191.197319784
            elsif samplenum = 13
                Add point... 'sample' 189.132682835
            elsif samplenum = 14
                Add point... 'sample' 187.115628613
            elsif samplenum = 15
                Add point... 'sample' 189.686222121
            elsif samplenum = 16
                Add point... 'sample' 185.492788312
            elsif samplenum = 17
                Add point... 'sample' 185.727067532
            elsif samplenum = 18
                Add point... 'sample' 185.433793939
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0157
		Add point... 'beforeintervalend' 1.0157
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 196.497010048
            elsif samplenum = 6
                Add point... 'sample' 194.467062408
            elsif samplenum = 7
                Add point... 'sample' 195.237275036
            elsif samplenum = 8
                Add point... 'sample' 194.024797267
            elsif samplenum = 9
                Add point... 'sample' 194.990265931
            elsif samplenum = 10
                Add point... 'sample' 194.044106505
            elsif samplenum = 11
                Add point... 'sample' 193.762100362
            elsif samplenum = 12
                Add point... 'sample' 193.370608611
            elsif samplenum = 13
                Add point... 'sample' 193.170815598
            elsif samplenum = 14
                Add point... 'sample' 193.159225597
            elsif samplenum = 15
                Add point... 'sample' 193.34193623
            elsif samplenum = 16
                Add point... 'sample' 193.316552907
            elsif samplenum = 17
                Add point... 'sample' 193.303055551
            elsif samplenum = 18
                Add point... 'sample' 194.218971717
            endif
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0032
		Add point... 'beforeintervalend' 1.0032
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 191.665393939
            elsif samplenum = 4
                Add point... 'sample' 192.646446009
            elsif samplenum = 5
                Add point... 'sample' 192.570708072
            elsif samplenum = 6
                Add point... 'sample' 192.360629506
            elsif samplenum = 7
                Add point... 'sample' 194.653276209
            elsif samplenum = 8
                Add point... 'sample' 190.632169369
            elsif samplenum = 9
                Add point... 'sample' 189.087705264
            elsif samplenum = 10
                Add point... 'sample' 189.889544589
            elsif samplenum = 11
                Add point... 'sample' 185.701891644
            elsif samplenum = 12
                Add point... 'sample' 184.221244774
            elsif samplenum = 13
                Add point... 'sample' 183.96489278
            elsif samplenum = 14
                Add point... 'sample' 184.042743483
            elsif samplenum = 15
                Add point... 'sample' 183.078180745
            elsif samplenum = 16
                Add point... 'sample' 182.125239894
            elsif samplenum = 17
                Add point... 'sample' 181.880465038
            elsif samplenum = 18
                Add point... 'sample' 182.365119924
            elsif samplenum = 19
                Add point... 'sample' 181.740003295
            elsif samplenum = 20
                Add point... 'sample' 181.831887879
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0016
		Add point... 'beforeintervalend' 1.0016
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 206.185330216
            elsif samplenum = 4
                Add point... 'sample' 204.985834727
            elsif samplenum = 5
                Add point... 'sample' 206.707340796
            elsif samplenum = 6
                Add point... 'sample' 209.909630972
            elsif samplenum = 7
                Add point... 'sample' 214.909997265
            elsif samplenum = 8
                Add point... 'sample' 215.73113412
            elsif samplenum = 9
                Add point... 'sample' 216.200366384
            elsif samplenum = 10
                Add point... 'sample' 218.794127847
            elsif samplenum = 11
                Add point... 'sample' 224.344630773
            elsif samplenum = 12
                Add point... 'sample' 230.63370391
            elsif samplenum = 13
                Add point... 'sample' 237.914205481
            elsif samplenum = 14
                Add point... 'sample' 245.206037866
            elsif samplenum = 15
                Add point... 'sample' 252.966338727
            elsif samplenum = 16
                Add point... 'sample' 260.157019825
            elsif samplenum = 17
                Add point... 'sample' 269.965396935
            elsif samplenum = 18
                Add point... 'sample' 276.425211839
            elsif samplenum = 19
                Add point... 'sample' 279.209084004
            elsif samplenum = 20
                Add point... 'sample' 286.2541375
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9911
		Add point... 'beforeintervalend' 0.9911
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### FOURTEENTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-14"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 261.775577576
            elsif samplenum = 6
                Add point... 'sample' 257.443601649
            elsif samplenum = 7
                Add point... 'sample' 258.093684618
            elsif samplenum = 8
                Add point... 'sample' 258.653437106
            elsif samplenum = 9
                Add point... 'sample' 260.104113361
            elsif samplenum = 10
                Add point... 'sample' 261.656680296
            elsif samplenum = 11
                Add point... 'sample' 262.975008744
            elsif samplenum = 12
                Add point... 'sample' 264.011375046
            elsif samplenum = 13
                Add point... 'sample' 264.213952977
            elsif samplenum = 14
                Add point... 'sample' 264.301128414
            elsif samplenum = 15
                Add point... 'sample' 263.811855946
            elsif samplenum = 16
                Add point... 'sample' 262.999018425
            elsif samplenum = 17
                Add point... 'sample' 261.91124022
            elsif samplenum = 18
                Add point... 'sample' 261.892262995
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0262
		Add point... 'beforeintervalend' 1.0262
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 252.558104545
            elsif samplenum = 4
                Add point... 'sample' 252.30546706
            elsif samplenum = 5
                Add point... 'sample' 263.422757996
            elsif samplenum = 6
                Add point... 'sample' 281.868998704
            elsif samplenum = 7
                Add point... 'sample' 305.941733566
            elsif samplenum = 8
                Add point... 'sample' 330.207096912
            elsif samplenum = 9
                Add point... 'sample' 360.2282757
            elsif samplenum = 10
                Add point... 'sample' 390.411861671
            elsif samplenum = 11
                Add point... 'sample' 413.218988127
            elsif samplenum = 12
                Add point... 'sample' 422.220834936
            elsif samplenum = 13
                Add point... 'sample' 427.272164115
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0818
		Add point... 'beforeintervalend' 1.0818
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 207.129003144
            elsif samplenum = 6
                Add point... 'sample' 203.508195081
            elsif samplenum = 7
                Add point... 'sample' 199.540390046
            elsif samplenum = 8
                Add point... 'sample' 196.644157231
            elsif samplenum = 9
                Add point... 'sample' 194.872881166
            elsif samplenum = 10
                Add point... 'sample' 193.440012025
            elsif samplenum = 11
                Add point... 'sample' 191.514074415
            elsif samplenum = 12
                Add point... 'sample' 189.156348542
            elsif samplenum = 13
                Add point... 'sample' 187.521056295
            elsif samplenum = 14
                Add point... 'sample' 185.753833417
            elsif samplenum = 15
                Add point... 'sample' 188.621581742
            elsif samplenum = 16
                Add point... 'sample' 184.268459957
            elsif samplenum = 17
                Add point... 'sample' 184.445968398
            elsif samplenum = 18
                Add point... 'sample' 184.213487879
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0314
		Add point... 'beforeintervalend' 1.0314
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 194.655035885
            elsif samplenum = 6
                Add point... 'sample' 192.448470762
            elsif samplenum = 7
                Add point... 'sample' 193.334350072
            elsif samplenum = 8
                Add point... 'sample' 191.994277633
            elsif samplenum = 9
                Add point... 'sample' 193.007058177
            elsif samplenum = 10
                Add point... 'sample' 191.985364959
            elsif samplenum = 11
                Add point... 'sample' 191.722329295
            elsif samplenum = 12
                Add point... 'sample' 191.377547092
            elsif samplenum = 13
                Add point... 'sample' 191.257103923
            elsif samplenum = 14
                Add point... 'sample' 191.311232276
            elsif samplenum = 15
                Add point... 'sample' 191.55890996
            elsif samplenum = 16
                Add point... 'sample' 191.683137632
            elsif samplenum = 17
                Add point... 'sample' 191.812434911
            elsif samplenum = 18
                Add point... 'sample' 192.941260101
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0064
		Add point... 'beforeintervalend' 1.0064
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 189.129337879
            elsif samplenum = 4
                Add point... 'sample' 190.461854518
            elsif samplenum = 5
                Add point... 'sample' 190.326934326
            elsif samplenum = 6
                Add point... 'sample' 189.621777617
            elsif samplenum = 7
                Add point... 'sample' 191.093599226
            elsif samplenum = 8
                Add point... 'sample' 185.620701483
            elsif samplenum = 9
                Add point... 'sample' 183.101005074
            elsif samplenum = 10
                Add point... 'sample' 183.144919336
            elsif samplenum = 11
                Add point... 'sample' 177.864452406
            elsif samplenum = 12
                Add point... 'sample' 175.803318779
            elsif samplenum = 13
                Add point... 'sample' 175.260862484
            elsif samplenum = 14
                Add point... 'sample' 174.980776518
            elsif samplenum = 15
                Add point... 'sample' 173.49102022
            elsif samplenum = 16
                Add point... 'sample' 172.071789313
            elsif samplenum = 17
                Add point... 'sample' 171.705728382
            elsif samplenum = 18
                Add point... 'sample' 172.440276387
            elsif samplenum = 19
                Add point... 'sample' 172.072502335
            elsif samplenum = 20
                Add point... 'sample' 174.218485758
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0031
		Add point... 'beforeintervalend' 1.0031
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 203.379643041
            elsif samplenum = 4
                Add point... 'sample' 203.178975251
            elsif samplenum = 5
                Add point... 'sample' 206.377435017
            elsif samplenum = 6
                Add point... 'sample' 210.74649708
            elsif samplenum = 7
                Add point... 'sample' 216.602739267
            elsif samplenum = 8
                Add point... 'sample' 217.880149573
            elsif samplenum = 9
                Add point... 'sample' 218.656634197
            elsif samplenum = 10
                Add point... 'sample' 221.637896602
            elsif samplenum = 11
                Add point... 'sample' 227.809227701
            elsif samplenum = 12
                Add point... 'sample' 234.621859383
            elsif samplenum = 13
                Add point... 'sample' 242.433023463
            elsif samplenum = 14
                Add point... 'sample' 250.196017002
            elsif samplenum = 15
                Add point... 'sample' 258.372450036
            elsif samplenum = 16
                Add point... 'sample' 265.679315922
            elsif samplenum = 17
                Add point... 'sample' 275.908588784
            elsif samplenum = 18
                Add point... 'sample' 282.998127068
            elsif samplenum = 19
                Add point... 'sample' 285.913584372
            elsif samplenum = 20
                Add point... 'sample' 293.737141667
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9823
		Add point... 'beforeintervalend' 0.9823
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### FIFTEENTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-15"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 261.981849697
            elsif samplenum = 6
                Add point... 'sample' 257.464971861
            elsif samplenum = 7
                Add point... 'sample' 258.217184785
            elsif samplenum = 8
                Add point... 'sample' 258.957657686
            elsif samplenum = 9
                Add point... 'sample' 260.618434515
            elsif samplenum = 10
                Add point... 'sample' 262.414404654
            elsif samplenum = 11
                Add point... 'sample' 263.881036143
            elsif samplenum = 12
                Add point... 'sample' 265.028520464
            elsif samplenum = 13
                Add point... 'sample' 265.28136583
            elsif samplenum = 14
                Add point... 'sample' 265.402504959
            elsif samplenum = 15
                Add point... 'sample' 264.94847142
            elsif samplenum = 16
                Add point... 'sample' 264.145281747
            elsif samplenum = 17
                Add point... 'sample' 263.276414177
            elsif samplenum = 18
                Add point... 'sample' 263.87863861
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0393
		Add point... 'beforeintervalend' 1.0393
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 255.070758741
            elsif samplenum = 4
                Add point... 'sample' 253.77870059
            elsif samplenum = 5
                Add point... 'sample' 265.324957124
            elsif samplenum = 6
                Add point... 'sample' 284.648598706
            elsif samplenum = 7
                Add point... 'sample' 310.227384965
            elsif samplenum = 8
                Add point... 'sample' 336.441210112
            elsif samplenum = 9
                Add point... 'sample' 368.887118037
            elsif samplenum = 10
                Add point... 'sample' 401.427246454
            elsif samplenum = 11
                Add point... 'sample' 426.090305324
            elsif samplenum = 12
                Add point... 'sample' 436.111317039
            elsif samplenum = 13
                Add point... 'sample' 442.407262839
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.1227
		Add point... 'beforeintervalend' 1.1227
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 204.119704041
            elsif samplenum = 6
                Add point... 'sample' 200.501586211
            elsif samplenum = 7
                Add point... 'sample' 196.510821608
            elsif samplenum = 8
                Add point... 'sample' 193.632473025
            elsif samplenum = 9
                Add point... 'sample' 191.957532006
            elsif samplenum = 10
                Add point... 'sample' 190.664604576
            elsif samplenum = 11
                Add point... 'sample' 189.022801366
            elsif samplenum = 12
                Add point... 'sample' 187.115377301
            elsif samplenum = 13
                Add point... 'sample' 185.909429755
            elsif samplenum = 14
                Add point... 'sample' 184.392038221
            elsif samplenum = 15
                Add point... 'sample' 187.556941364
            elsif samplenum = 16
                Add point... 'sample' 183.044131602
            elsif samplenum = 17
                Add point... 'sample' 183.164869264
            elsif samplenum = 18
                Add point... 'sample' 182.993181818
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0472
		Add point... 'beforeintervalend' 1.0472
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 192.813061722
            elsif samplenum = 6
                Add point... 'sample' 190.429879115
            elsif samplenum = 7
                Add point... 'sample' 191.431425108
            elsif samplenum = 8
                Add point... 'sample' 189.963757999
            elsif samplenum = 9
                Add point... 'sample' 191.023850423
            elsif samplenum = 10
                Add point... 'sample' 189.926623412
            elsif samplenum = 11
                Add point... 'sample' 189.682558228
            elsif samplenum = 12
                Add point... 'sample' 189.384485574
            elsif samplenum = 13
                Add point... 'sample' 189.343392248
            elsif samplenum = 14
                Add point... 'sample' 189.463238955
            elsif samplenum = 15
                Add point... 'sample' 189.77588369
            elsif samplenum = 16
                Add point... 'sample' 190.049722357
            elsif samplenum = 17
                Add point... 'sample' 190.321814272
            elsif samplenum = 18
                Add point... 'sample' 191.663548485
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0096
		Add point... 'beforeintervalend' 1.0096
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 186.593281818
            elsif samplenum = 4
                Add point... 'sample' 188.277263027
            elsif samplenum = 5
                Add point... 'sample' 188.08316058
            elsif samplenum = 6
                Add point... 'sample' 186.882925728
            elsif samplenum = 7
                Add point... 'sample' 187.533922244
            elsif samplenum = 8
                Add point... 'sample' 180.609233597
            elsif samplenum = 9
                Add point... 'sample' 177.114304884
            elsif samplenum = 10
                Add point... 'sample' 176.400294084
            elsif samplenum = 11
                Add point... 'sample' 170.027013168
            elsif samplenum = 12
                Add point... 'sample' 167.385392784
            elsif samplenum = 13
                Add point... 'sample' 166.556832188
            elsif samplenum = 14
                Add point... 'sample' 165.918809554
            elsif samplenum = 15
                Add point... 'sample' 163.903859696
            elsif samplenum = 16
                Add point... 'sample' 162.018338731
            elsif samplenum = 17
                Add point... 'sample' 161.530991725
            elsif samplenum = 18
                Add point... 'sample' 162.515432849
            elsif samplenum = 19
                Add point... 'sample' 162.405001375
            elsif samplenum = 20
                Add point... 'sample' 166.605083636
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0047
		Add point... 'beforeintervalend' 1.0047
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 200.573955866
            elsif samplenum = 4
                Add point... 'sample' 201.372115775
            elsif samplenum = 5
                Add point... 'sample' 206.047529238
            elsif samplenum = 6
                Add point... 'sample' 211.583363188
            elsif samplenum = 7
                Add point... 'sample' 218.295481269
            elsif samplenum = 8
                Add point... 'sample' 220.029165026
            elsif samplenum = 9
                Add point... 'sample' 221.11290201
            elsif samplenum = 10
                Add point... 'sample' 224.481665358
            elsif samplenum = 11
                Add point... 'sample' 231.273824628
            elsif samplenum = 12
                Add point... 'sample' 238.610014856
            elsif samplenum = 13
                Add point... 'sample' 246.951841444
            elsif samplenum = 14
                Add point... 'sample' 255.185996138
            elsif samplenum = 15
                Add point... 'sample' 263.778561344
            elsif samplenum = 16
                Add point... 'sample' 271.201612018
            elsif samplenum = 17
                Add point... 'sample' 281.851780634
            elsif samplenum = 18
                Add point... 'sample' 289.571042297
            elsif samplenum = 19
                Add point... 'sample' 292.618084739
            elsif samplenum = 20
                Add point... 'sample' 301.220145833
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9734
		Add point... 'beforeintervalend' 0.9734
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		select Manipulation 'continuumfilename$'
		Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor




#### SIXTEENTH CONTINUUM FILE ####

# set up manipulation file
continuumfilename$ = stimname$ + "-16"
select Sound 'stimname$'
To Manipulation... 0.01 75 600
Rename... 'continuumfilename$'
Extract pitch tier
Rename... 'continuumfilename$'
select Manipulation 'continuumfilename$'
Extract duration tier
Rename... 'continuumfilename$'

### resynthesizing each interval of interest

for interval from 1 to number_intervals
	select TextGrid 'stimname$'
	intname$ = ""
	intname$ = Get label of interval... 1 interval

	### modifying f0 of each word
	
	if intname$ = "it"
		# set up the first time point & the incrementer
		# increments by total duration / 19 --> 20 equally spaced time points
		intervalstart = Get start point... 1 interval
		nowstart = intervalstart
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove existing pitch points on 'it'
		select PitchTier 'continuumfilename$'
		Remove points between... intervalstart intervalend

		# add pitch points via terrible set of elsif statements
		# i looked and see no other way :(
		# samples prior to 4 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 262.188121818
            elsif samplenum = 6
                Add point... 'sample' 257.486342074
            elsif samplenum = 7
                Add point... 'sample' 258.340684951
            elsif samplenum = 8
                Add point... 'sample' 259.261878266
            elsif samplenum = 9
                Add point... 'sample' 261.13275567
            elsif samplenum = 10
                Add point... 'sample' 263.172129013
            elsif samplenum = 11
                Add point... 'sample' 264.787063541
            elsif samplenum = 12
                Add point... 'sample' 266.045665881
            elsif samplenum = 13
                Add point... 'sample' 266.348778682
            elsif samplenum = 14
                Add point... 'sample' 266.503881503
            elsif samplenum = 15
                Add point... 'sample' 266.085086893
            elsif samplenum = 16
                Add point... 'sample' 265.291545069
            elsif samplenum = 17
                Add point... 'sample' 264.641588133
            elsif samplenum = 18
                Add point... 'sample' 265.865014225
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0525
		Add point... 'beforeintervalend' 1.0525
		Add point... 'intervalend' 1
			
	### modifying f0 of "looks"

	elsif intname$ = "looks"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 257.583412937
            elsif samplenum = 4
                Add point... 'sample' 255.25193412
            elsif samplenum = 5
                Add point... 'sample' 267.227156252
            elsif samplenum = 6
                Add point... 'sample' 287.428198708
            elsif samplenum = 7
                Add point... 'sample' 314.513036364
            elsif samplenum = 8
                Add point... 'sample' 342.675323311
            elsif samplenum = 9
                Add point... 'sample' 377.545960374
            elsif samplenum = 10
                Add point... 'sample' 412.442631237
            elsif samplenum = 11
                Add point... 'sample' 438.961622522
            elsif samplenum = 12
                Add point... 'sample' 450.001799141
            elsif samplenum = 13
                Add point... 'sample' 457.542361563
            endif
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.1536
		Add point... 'beforeintervalend' 1.1536
		Add point... 'intervalend' 1
			
	### modifying f0 of "like"

	elsif intname$ = "like"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 201.110404938
            elsif samplenum = 6
                Add point... 'sample' 197.494977341
            elsif samplenum = 7
                Add point... 'sample' 193.481253169
            elsif samplenum = 8
                Add point... 'sample' 190.62078882
            elsif samplenum = 9
                Add point... 'sample' 189.042182845
            elsif samplenum = 10
                Add point... 'sample' 187.889197128
            elsif samplenum = 11
                Add point... 'sample' 186.531528317
            elsif samplenum = 12
                Add point... 'sample' 185.074406059
            elsif samplenum = 13
                Add point... 'sample' 184.297803215
            elsif samplenum = 14
                Add point... 'sample' 183.030243025
            elsif samplenum = 15
                Add point... 'sample' 186.492300985
            elsif samplenum = 16
                Add point... 'sample' 181.819803247
            elsif samplenum = 17
                Add point... 'sample' 181.88377013
            elsif samplenum = 18
                Add point... 'sample' 181.772875758
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0629
		Add point... 'beforeintervalend' 1.0629
		Add point... 'intervalend' 1
			
	### modifying f0 of "a"

	elsif intname$ = "a"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 5
                Add point... 'sample' 190.97108756
            elsif samplenum = 6
                Add point... 'sample' 188.411287469
            elsif samplenum = 7
                Add point... 'sample' 189.528500144
            elsif samplenum = 8
                Add point... 'sample' 187.933238365
            elsif samplenum = 9
                Add point... 'sample' 189.04064267
            elsif samplenum = 10
                Add point... 'sample' 187.867881866
            elsif samplenum = 11
                Add point... 'sample' 187.642787161
            elsif samplenum = 12
                Add point... 'sample' 187.391424055
            elsif samplenum = 13
                Add point... 'sample' 187.429680573
            elsif samplenum = 14
                Add point... 'sample' 187.615245633
            elsif samplenum = 15
                Add point... 'sample' 187.99285742
            elsif samplenum = 16
                Add point... 'sample' 188.416307082
            elsif samplenum = 17
                Add point... 'sample' 188.831193632
            elsif samplenum = 18
                Add point... 'sample' 190.385836869
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0128
		Add point... 'beforeintervalend' 1.0128
		Add point... 'intervalend' 1
			
	### modifying f0 of target

	elsif intname$ = "target"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 2 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 184.057225758
            elsif samplenum = 4
                Add point... 'sample' 186.092671535
            elsif samplenum = 5
                Add point... 'sample' 185.839386835
            elsif samplenum = 6
                Add point... 'sample' 184.14407384
            elsif samplenum = 7
                Add point... 'sample' 183.974245261
            elsif samplenum = 8
                Add point... 'sample' 175.597765711
            elsif samplenum = 9
                Add point... 'sample' 171.127604694
            elsif samplenum = 10
                Add point... 'sample' 169.655668831
            elsif samplenum = 11
                Add point... 'sample' 162.18957393
            elsif samplenum = 12
                Add point... 'sample' 158.967466788
            elsif samplenum = 13
                Add point... 'sample' 157.852801891
            elsif samplenum = 14
                Add point... 'sample' 156.856842589
            elsif samplenum = 15
                Add point... 'sample' 154.316699171
            elsif samplenum = 16
                Add point... 'sample' 151.964888149
            elsif samplenum = 17
                Add point... 'sample' 151.356255068
            elsif samplenum = 18
                Add point... 'sample' 152.590589312
            elsif samplenum = 19
                Add point... 'sample' 152.737500416
            elsif samplenum = 20
                Add point... 'sample' 158.991681515
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 1.0063
		Add point... 'beforeintervalend' 1.0063
		Add point... 'intervalend' 1

	### modifying f0 of target2

	elsif intname$ = "2"

		# set up the first time point & the incrementer
		intervalstart = Get start point... 1 interval
		intervalend = Get end point... 1 interval
		intervaldur = intervalend - intervalstart
		binsize = intervaldur / 19
		sample = intervalstart
		samplenum = 1

		# remove pitch points on 'put the'
		select PitchTier 'continuumfilename$'
		Remove points between... 'intervalstart' 'intervalend'

		# add pitch points 
		# samples prior to 3 were unvoiced
        while samplenum <= 20
            if samplenum = 3
                Add point... 'sample' 197.768268691
            elsif samplenum = 4
                Add point... 'sample' 199.565256299
            elsif samplenum = 5
                Add point... 'sample' 205.717623459
            elsif samplenum = 6
                Add point... 'sample' 212.420229295
            elsif samplenum = 7
                Add point... 'sample' 219.98822327
            elsif samplenum = 8
                Add point... 'sample' 222.178180478
            elsif samplenum = 9
                Add point... 'sample' 223.569169822
            elsif samplenum = 10
                Add point... 'sample' 227.325434114
            elsif samplenum = 11
                Add point... 'sample' 234.738421555
            elsif samplenum = 12
                Add point... 'sample' 242.598170329
            elsif samplenum = 13
                Add point... 'sample' 251.470659425
            elsif samplenum = 14
                Add point... 'sample' 260.175975274
            elsif samplenum = 15
                Add point... 'sample' 269.184672652
            elsif samplenum = 16
                Add point... 'sample' 276.723908115
            elsif samplenum = 17
                Add point... 'sample' 287.794972484
            elsif samplenum = 18
                Add point... 'sample' 296.143957526
            elsif samplenum = 19
                Add point... 'sample' 299.322585107
            elsif samplenum = 20
                Add point... 'sample' 308.70315
            endif
		
			# increment samplenum & sample
			samplenum = samplenum + 1
			sample = sample + binsize
		endwhile

		# add duration points
		afterintervalstart = intervalstart + 0.000001
		beforeintervalend = intervalend - 0.000001
		select DurationTier 'continuumfilename$'
		Add point... 'intervalstart' 1
		Add point... 'afterintervalstart' 0.9645
		Add point... 'beforeintervalend' 0.9645
		Add point... 'intervalend' 1

		# actually resynthesize the soundfile

		#soundfilestart = nowstart - 0.1
		
		select Manipulation 'continuumfilename$'
		plus PitchTier 'continuumfilename$'
		Replace pitch tier
	
		select Manipulation 'continuumfilename$'
		plus DurationTier 'continuumfilename$'
		Replace duration tier

		select Manipulation 'continuumfilename$'
		Get resynthesis (overlap-add)

		select Sound 'continuumfilename$'
		Write to WAV file... 'continuumfilename$'.wav
		#select Manipulation 'continuumfilename$'
		#Write to text file... 'continuumfilename$'.Manipulation

	endif
endfor
endfor