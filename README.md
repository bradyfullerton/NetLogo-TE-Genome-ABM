## **Project Title**  
Transposable Element Genome Agent-Based Model in NetLogo

## **Description**  
This is a relatively simple NetLogo model of TE "behaviour" in the Genome over evolutionary time. You can use it to test certain assumptions about the genome and TEs as well as to model different possible situations. It can be very interesting to try and create states that resemble known facts about certain genomes from simple starting conditions.

## **Installation Instructions**
There are two options for using the model.

**Option 1: Download NetLogo and run the model locally**
If you are committed to learning NetLogo or getting the most out of this model then this is the option I recommend.

Step 1: Download the v2.0_TE_Genome_ABM.nlogo file from the GitHub repository. (Choose v1.0_TE_Genome_ABM.nlogo if you need a simpler model to get up to speed.)

Step 2: Direct your web browser of choice to https://ccl.northwestern.edu/netlogo/download.shtml and downlaod the latest version of NetLogo.

Step 3: Install NetLogo from the downloaded .msi file.

Step 4: Open the NetLogo application you just installed (the regular version not the 3D version if it was included) and go to File > Open and select the v2.0_TE_Genome_ABM.nlogo or v1.0_TE_Genome_ABM.nlogo file you downloaded in Step 1. This will open the model in NetLogo and you can begin using it.

**Option 2: Run the model in the web version of NetLogo**
If you have limited computing power and simply want to get started as quickly as possible, choose this option.

Step 1: Download the v2.0_TE_Genome_ABM.html file from the GitHub repository. (Choose v1.0_TE_Genome_ABM.html if you need a simpler model to get up to speed.)

Step 2: Open the html file in your web browser of choice. This should open a fully functional instance of the model in your browser. If it does not then go on to Step 3.

Step 3: Open the NetLogo website model launcher at https://www.netlogoweb.org/launch (This will also open a random sample model but you can ignore that and move on to step 4.)

Step 4: At the top right of the NetLogo model launcher (website) you will see "Uplaod a Model:" and a buitton that says "Choose File." Click this button and choose the downloaded model file from your local computer. This will load the model regardless of whether you choose a downloaded .html file or .nlogo file.

## **Usage**  
Version 2.0 of the model is far more complicated than Version 1.0 and allows the user to adjust numerous settings in the model to test different assumptions and "behaviours." The NetLogo files, both the Web version and the local application version include an "Info" tab that has detailed instructions on how to use the model and what each slider and switch does. I will repeat part of that Info tab here but I would recommend that the user simply skip these notes here and jump into the model and the instructions included in the model file.

From NetLogo "Info" tab:

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

## **Contributing** 
I would love to see changes made through GitHub. Please feel free to fork, make changes, and submit pull requests. I'm also open to hearing theoretical feedback that is not code-based but which I could incorporate and code myself.

## **License**  
This work is shared with an MIT license. Please read the license file in the GitHub repository to learn more about use, modification, and attribution. 

## **Contact Information**
Please feel free to contact me directly at brady.fullerton@gmail.com if you have any questions. Otherwise, feel free to engage with the code through GitHub.