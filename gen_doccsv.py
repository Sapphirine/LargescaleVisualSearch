import sys, re, string
def gen_doc_csv(vid_list):
    csv_file = open("data.csv",'w+')
    num = 0
    for line in vid_list:
        vid_file = open('./docs/'+line.strip(), 'r')
        num = num + 1
        article = vid_file.read()
        csv_file.write(str(num)+',')
        for word in article:
            csv_file.write(word)
        csv_file.write('\n')
    csv_file.close()


if __name__ == '__main__':
    vid_list = open("vid_list.txt",'r')
    gen_doc_csv(vid_list)
    vid_list.close()
