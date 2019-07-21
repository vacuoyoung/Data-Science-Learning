### Week 1 Raw and Processed Data

**Downloading Files**  
- File Path
  - Relative, *setwd("") or setwd("/")*
  - Absolute, *setwd("")*

- Creating directories
  - *file.exists("directoryname")*
  - *dir.create("")*

- Downloading file()
  download.file("fileUrl", destfile = "", method="curl")
  *list.files("")*

- Reading Excel files
  - library(xlsx)
  *read.xlsx("filename&dir",sheetIndex=1,header=TRUE, colIndex=, rowIndex=)*
  *write.xlsx()*

- Reading XML(Extensible Markup Lauguage)
    - for most web scraping
    -*Tags*, <section>...</section>
    - *Elements*  specific examples of tags
    - *Attributes*

```
    library(XML)
    doc <- xmlTreeParse(fileurl,useInternal=TRUE) ##把文档载入R内存中
    rootNode<-xmlRoot(doc) ##获得所有xml的根结点
    xmlName(rootNode) ##获取所有 节点的名字
```
  xmlSApply(rootNode,xmlValue) *遍历所有节点，返回节点名称*
  xpathSApply(rootNode, "Name",xmlValue)

- Reading JSON
  ```
    library(jsonlite)
    jsonData <- fromJSON("URL")
    name(jsonData)
  ```  

#### The data table package
  Write in C, thus much faster than data.frame

```
libary(data.table)
DF = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
tables(

DT[2,]
```
Cloumn subsetting in data.table
```
{
  x=1
  y=2
}
k = {print(10);5}
```
分号在R中表示的是两条语句

DT[,w:=z^2] *:=* 在数据框中增加一个新变量，并对其进行赋值
Multiple Operations,
- DT[,m:={tmp <-(x+z); log2(tmp+5)}]
data.table会持续更新，所以会很快，节约内存

*.N* An integer, lenth 1, contianing the number r

DT[, .N, by=x], 把B按照x分成组，然后.N会计算每组中数值出现的次数，by是依据by**group的意思。

**Keys in Data table**
- setkey(DT,x), DT["a"], 则会根据key即x的数据列出所有为a的row
merge也可以一句key进行

### Reading from MySQL ###

**installation**, intall.packages("RMySQL")

```
handlerDb <- dbConnect(MySQL(),db=" ",user=" ",host=" ")
targetDb <- dbGetQuery(handlerDb,"show databases");dbDisconnect(handlerDb)
```
**dbConnect**
**dbGetQuery** 后续执行的操作
**dbDisconnect**
**dbListFields**
**dbReadTable**
**dbSendQuery** 发出要求，fetch （）返回本地

### Reading from HDF5 ###

bioLite("rhdf5")

library(rdhf5)
created = h5createFile("example.h5")
created

created = h5createGroup("example.h5","foo")
A = mtrix(1:10,br=5,nc=2)
h5write(A, "example.h5","foo/A",index=list(1:3,1))
h5read("example.h5","foo/A

### Reading from the Web ###

con = **url("")**
htmlCode = **readLines(con)**
close(con)
htmlCode

html<-thmlTreeParse(url.useInternal )

library(**httr**)
html2 =GET(url)
content2 = content (html2, as="text")
parsedHtml = htmlParse(content2, asText=TRUE)
xpathSapply(parsedHtml，“//title”,xmlValue)

GET("url", authenticate("user","passwd"))

**using handles**
google = handle("")
GET(handle=google, path="/")

### Reading from APIs ###  

Accessing Twitter from R

myapp = oauth_app("twitter", key="your ConsumerKey",secret="your consumer seret")
sig = sign_oauth1.0(myapp, token="",token_secret="")
homeTL=GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)

json1= content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))

httr allows **GET, POST,PUT,DELET**

### Reading From other Sources ###

file - open a connection to a text file
url -
gzfile
bzfile

foreign package, Loads data from Minitab, SAS, S, SPSS, Stata
Basic fouctions read.foo
  - read.arff(Weka)
  - read.lta(Stata)
  - read.mtp(Minitab)
  - read.octave(Octave)
  - read.spss(SPSS)
  - read.xport(SAS)
