# project info #

1. Video Sampling
Sampling is achieved by OpenCV. Run the pic_extract.py. The result is stored in the directory demo_picture

2. Descriptor Extraction
Descriptor Extraction is implemented by CDVS on Matlab. Run load_db_set.m to extract descriptor and store the result in the database.
The result is stored in the files TestDB0 - TestDB418.

3. Clustering
Run pic_db_cluster.m to generate the label of each image and the result is saved in file pic_dbmap.txt. This algorithm also depends on CDVS.
Run doc_generator.py to replace the image with its label. So, the video is transformed into text after this step.
Run gen_doccsv.py to store all the transformed video in data.csv

4. Generating Stanford Topic Model Toolbox
Standford Topic Model Toolbox can be downloaded from http://nlp.stanford.edu/software/tmt/tmt-0.4/
To start the GUI of Stanford Topic Model Toolbox, use command "java -jar tmt-0.4.0.jar".
Note that Java 6 or 7 is a must for this tool box.
Run the example-2-lda-learn.scala.
The result topic model is stored in summary.txt in /lda-ad9c4149-30-26741906/01000.

5. Use excel to analyze the data stored in /lda-ad9c4149-30-26741906/document-topic-distributions.csv

