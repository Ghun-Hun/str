library(XBRL)
library(RCurl)
library(curl)
# 上市、上櫃、興櫃、公開發行 
mType<-c("sii", "otc", "rotc", "pub")
# 1-水泥工業     2-食品工業       3-塑膠工業       4-紡織纖維       5-電機機械
# 6-電器電纜     7-化學生技醫療   8-玻璃陶瓷       9-造紙工業       10-鋼鐵工業
# 11-橡膠工業    12-汽車工業      13-電子工業      14-建材營造      15-航運業
# 16-觀光事業    17-金融保險業    18-貿易百貨      19-綜合企業      20-其他
# 21-化學工業    22-生技醫療業    23-油電燃氣業    24-半導體業      25-電腦及週邊設備業
# 26-光電業      27-通信網路業    28-電子零組件業  29-電子通路業    30-資訊服務業
# 31-其他電子業  32-文化創意業                                      80-管理股票
# 91-存託憑證    97-證金公司      98-期貨商        99-投信投顧公司  XX-證券
iType<-c("01","02","03","04","05","06","07","08","09",10:32,80,91,97,98,99,"XX")
# 個別財報、個體財報、合併報表 
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


