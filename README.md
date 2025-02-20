Version 2.0: From NetLogo "Info" Tab

## WHAT IS IT?

This is a simple model of the genome with variables that allow the modeling of Transposable Element 'behaviour' in the genome as an ecosystem. The model should be thought of as acting over evolutionary time though at certain settings and speeds it could represent a much shorter period of time.

## HOW IT WORKS

The rules of the model are relatively simple and few are fixed. Most rules can be adjusted by sliders. Gene count, as well as TE counts, movement rates, movement distance, and propensity to hide in 'safe zones' around genes are all determined by the user. Genomic controls are controlled by the user as well. Finally, the user can control rates of gene development, and TE invasion.

## HOW TO USE IT

### TE Start Numbers

Set the model start numbers for TEs here. This can be zero if you wish to simulate invasion only.

**#te_class1**

Set the starting number of Class 1 (RNA) Transposons. These transposons move around the genome by copying and pasting themselves. Class 1 TEs are represented by light blue squares.

**#te_class2**

Set the starting number of Class 2 (DNA) Transposons. These transposons move around the genome by cutting and pasting themselves. Class 2 TEs are represented by orange squares.

### Gene Start Numbers
Set the model start numbers for genes here. (This can be zero if you wish to simulate gene development only, but the model will not run if there are no TEs or genes. At least one is required to run the model, though it could be one gene or one TE.)  Genes are represented by green squares.

**#genes**

Set the starting number of genes.

### TE Movement Rates

Set the probability that TEs will move by either copy and pasting or cut and pasting behaviours.

**te_class1_movement_rate_prob**

Set the probability that a Class 1 TE will copy and paste at any given moment.

**te_class2_movement_rate_prob**

Set the probability that a Class 2 TE will cut and paste at any given moment.

### TE Movement Distances

Set the distance that a TE will move during any given movement. Distance actually moved by a TE is a random value within the range set by the slider. This number represents an actual patch distance in the model world and will need to be adjusted if the size of the model is adjusted.

**te_class1_movement_distance**

Set the distance that a Class 1 TE will move during any given copy and paste. 

**te_class2_movement_distance**

Set the distance that a Class 2 TE will move during any given cut and paste. 

### TE Hiding Behaviour

Set the behavioural parameters that would cause a TE to “hide” or “shelter” near a gene, representing a strategy of taking advantage of the difficulty of genomic methylation in this area. The value can be adjusted both in terms of “safe” distance from a gene as well as the probability that a TE will remain sheltered or try to move through copying and pasting or cutting and pasting. Since this distance is different from the actual genomic control rates the user can adjust the accuracy of a TE’s “judgement” of “safety.”

**gene_proximity_teclass1**

Set the distance between a gene and TE at which a Class 1 TE will stop copying and pasting (given the probability of hiding).

**gene_proximity_teclass2**

Set the distance between a gene and TE at which a Class 2 TE will stop cutting and pasting (given the probability of hiding).

**te_class1_hiding_prob**

Set the probability that (given a certain distance between a gene and TE) a Class 1 TE will stop copying and pasting.

**te_class2_hiding_prob**

Set the probability that (given a certain distance between a gene and TE) a Class 2 TE will stop cutting and pasting.

### Genomic Control Rates

Set the parameters for genomic controls such as DNA methylation and RNAi controls. (Please note that since TE movement is represented by jumps from one location to another, and not slow movement through the space of the model, this is arguably a flawed representation of RNAi controls.)

**control_rate_prob**

Set the probability that on any given patch a TE will be methylated at any given moment.

**gene_proximity_control**

Set the distance between a gene and a TE at which methylation will no longer occur and a TE will effectively be safe.

### Gene Development

Set the parameters of gene development. This represents the development of genes over evolutionary time.

**gene_development**

Turn the entire process of gene development on or off.

**gene_development_prob**

Set the probability that at any given moment some number of genes will appear in the model semi-randomly.

**#genes_development**

Set the range within which a random number of genes will develop if they do develop (given the probability of gene development.)

### TE Invasion

Set the parameters TE invasion. This represents the invasion of parasitic and viral TEs over evolutionary time.

**te_invasion**

Turn the entire process of TE invasion on or off.

**te_class1_invasion_prob**

Set the probability that at any given moment (tick) a number of Class 1 TEs will invade.

**te_class2_invasion_prob**

Set the probability that at any given moment (tick) a number of Class 2 TEs will invade.

**#te_class1_invasion**

Set the range within which a random number of Class 1 TEs will invade if they do invade (given the probability of TE invasion.)

**#te_class2_invasion**

Set the range within which a random number of Class 2 TEs will invade if they do invade (given the probability of TE invasion.)

## THINGS TO NOTICE

Notice that Class 1 TEs are generally extremely successful at replication and it takes specific measures to ensure that the simulation is not overwhelmed by their copying and pasting. Class 2 TEs on the other hand require careful slider settings to have a fighting chance. 

## THINGS TO TRY

Try to see if you can get Class 2 TEs to outcompete Class 1 TEs in counts. Try to see when patterns emerge that resemble known facts about certain genomes.

## EXTENDING THE MODEL

Genes currently do not die and the model does not stop if genes are overcrowded by TEs. Think about adding conditions under which genes are damaged or die and the model stops or a fitness cost is calculated.

## NETLOGO FEATURES


## RELATED MODELS

I could find no NetLogo models of the interior of the gene but I benefitted greatly from studying various relatively simple models.

## CREDITS AND REFERENCES



Version 1.0: From NetLogo "Info" Tab:

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
