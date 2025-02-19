From NetLogo "Info" Tab:

## WHAT IS IT?

This is a simple model of the genome with variables that allow the modeling of Transposable Element 'behaviour' in the genome as an ecosystem. The model should be thought of as acting over evolutionary time though at certain settings and speeds it could represent a much shorter period of time.

## HOW IT WORKS

The rules of the model are relatively simple and few are fixed. Most rules can be adjusted by sliders. Gene count, as well as TE counts, movement rates, movement distance, and propensity to hide in 'safe zones' around genes are all determined by the user. Methylation (or genomic controls more broadly) are controlled by the user as well.

## HOW TO USE IT

Use the first column of sliders to set the initial counts of TEs and genes. You can try to set a ratio that you have identified in nature or you can play with these numbers more freely. 

Use the second column of sliders to adjust TE movement rate (the probability that a TE will copy and paste or cut and paste during any given tick), TE movement distance (the maximum distance that a TE will travel when it copy and pastes or cut and pastes), TE hiding probability (think of this as the chance that a TE will 'feel safe' when it is within a certain distance of a gene, which is also set by a slider), and TE Invasion rates (the chance that some random number of TEs within a given range will invade the genome in a given tick.)

Use the third column of sldiers to adjust genomic controls. While this is technically titled as methylation it can also represent RNAi controls. This is the chance that at any given tick a TE will be methylated (die.) This process cannot operate within certain distances of the gene. (For this reason one can see why it is a crude measure of RNAi controls.)

## THINGS TO NOTICE

Notice that Class 1 TEs are generally extremely successful at replication and it takes specific measures to ensure that the simulation is not overwhelmed by their copying and pasting. Class 2 TEs on the other hand require careful slider settings to have a fighting chance. 

## THINGS TO TRY

Try to see if you can get Class 2 TEs to outcompete Class 1 TEs in counts. Try to see when patterns emerge that resemble known facts about certain genomes.

## EXTENDING THE MODEL

If you want to play with the code notice that methylation and TE hiding use the same variables to account for TE distance to the gene. Basically, TEs are quite good at 'knowing' when they're safe. See if you can code in some further complexity and uncertainty. 

Genes currently do not die and the model does not stop if genes are overcrowded by TEs. Think about adding conditions under which genes are damaged or die and the model stops or a fitness cost is calculated.

TE Invasion rate is calculated as a probability that some random number of TE's within the range of the initial TE count for that class of TE divided by 100 will invade the genome in a given tick. This could be refined further in the code.

## NETLOGO FEATURES


## RELATED MODELS

I could find no NetLogo models of the interior of the genome but I benefitted greatly from studying various relatively simple models.

## CREDITS AND REFERENCES

Thank you to Stefan Linquist for feedback on this first draft of the model. I hope that it will be improved and refined over time.
