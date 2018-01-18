library(XBRL)
library(RCurl)
library(curl)
# �W���B�W�d�B���d�B���}�o�� 
mType<-c("sii", "otc", "rotc", "pub")
# 1-���d�u�~     2-���~�u�~       3-�콦�u�~       4-��´�ֺ�       5-�q������
# 6-�q���q�l     7-�ƾǥͧ�����   8-��������       9-�y�Ȥu�~       10-���K�u�~
# 11-�󽦤u�~    12-�T���u�~      13-�q�l�u�~      14-�ا���y      15-��B�~
# 16-�[���Ʒ~    17-���īO�I�~    18-�T���ʳf      19-��X���~      20-��L
# 21-�ƾǤu�~    22-�ͧ������~    23-�o�q�U��~    24-�b����~      25-�q���ζg��]�Ʒ~
# 26-���q�~      27-�q�H�����~    28-�q�l�s�ե�~  29-�q�l�q���~    30-��T�A�ȷ~
# 31-��L�q�l�~  32-��ƳзN�~                                      80-�޲z�Ѳ�
# 91-�s�U����    97-�Ҫ����q      98-���f��        99-��H���U���q  XX-�Ҩ�
iType<-c("01","02","03","04","05","06","07","08","09",10:32,80,91,97,98,99,"XX")
# �ӧO�]���B����]���B�X�ֳ��� 
rType <-c("A", "B", "C")

url<-"http://mops.twse.com.tw/server-java/FileDownLoad?firstin=true&step=9&fileName=" 
# <= "2012"
year<-"2012"

cburl<-function(urls,years,q,mT,iT,rT=rType[3]){
  filename<-paste0(years,"-",q,"-",mT,"-",iT,"-",rT,".zip")
  if(years<=2012){
    cburls<-paste0(urls,filename,"&filePath=/home/html/nas/xbrl/",years,"/")
  }else{
    cburls<-paste0(urls,filename,"&filePath=/home/html/nas/ifrs/",years,"/")
  }
  cburls
}

urls<-cburl(url,"2014","02",mType[1],iType[2],rType[3])

download.file(urls,destfile="reviews.zip",method="libcurl",mode="wb")

