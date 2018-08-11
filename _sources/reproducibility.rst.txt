=======================================
Reproducibility is the name of the game
=======================================

There are two basic reasons to make your research reproducible. The first is **to show evidence of the correctness of your results**. The second one  is **to enable others to make use of our methods and results**.
So to achieve it we need to recognize that:

 * A well-defined standard project structure means that a newcomer can begin to understand an analysis without having to look into an extensive documentation.
 * It also means that you do not necessarily have to read 100% of the code before you know where to look for very specific things.
 * A well-organized code tends to self-document, since the organization itself provides the context for its code without too much overhead. 
 * Your team collaborates more easily with you on this analysis 
 * Learn yourself from your analysis about the research process
 * Feel more confident in the conclusions of the project 



You will get what you put: Provenance
=====================================
The term "data provenance" refers to a record that explains the origin of a piece of data (in a database, document or repository) along with an explanation of how and why it arrived at the current location. Trading quants need the provenance like the trees the sunlight.

*Example*: In an application like quantitative strategies, a lot of data is derived from public databases or brokers, which in turn might be derived from papers but after some clearing and transformations (only the most significant data are put into the public database), which are derived from data markets. A good provenance record will keep the whole history for each piece of data.
Here are some questions we have learned to ask with a sense of existential fear:

 * Are we supposed to go in and join the feature column X to the data before we get started (raw data) or did that come from one of our notebooks? 
 * Come to think of it, which notebook do we have to run first before running the plotting code: was it "process data" or "clean data"?
 * Where did the shapefiles get downloaded from for the price plots?
 * Etceter, etcetera, ...

These types of questions are painful and are symptoms of a disorganized, foolish project. A good project structure encourages practices that make it easier to come back to old work.
You should make sure tha it is clear on how you came to certain conclusions. Just because something makes sense to you, it is not clear that it does for others (yourself next month). When making claims based on your analysis, you must link them to the data on which you base them. This is to ensure that you or others who read your work can easily follow the steps you took from the data to the conclusions. Having a complete context makes it easy to understand the work process and relate to it by reproducing it.

Another benefit is that all raw data remains available to you and, if you wish, for others, to access and consult. This helps transparency and, again, makes it easier for others to understand your workflow.


