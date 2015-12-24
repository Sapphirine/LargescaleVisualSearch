import sys

def generate_docs(pic_dbmap):
    for line in pic_dbmap:
        lparts = line.strip().split() 
        pic_name = lparts[0]
        cluster = int(lparts[1])
        ##print cluster
        pparts1 = pic_name.split('.')
        pparts2 = pparts1[0].split('_')
        vid_name = '_'.join(pparts2[0:-1]) 
        ##print vid_name
        vid_file = open("./docs/"+vid_name+".txt",'a+')
            
        vid_file.write(str(cluster)+' ')
        vid_file.close()


if __name__ == '__main__':
    pic_dbmap = open("pic_dbmap.txt",'r')
    generate_docs(pic_dbmap)
    pic_dbmap.close()
