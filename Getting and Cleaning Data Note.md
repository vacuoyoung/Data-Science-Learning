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
    - *Tags*, <section>...</section>
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

### Subsetting and Sorting ###

- Dealing with missing values
  *X[which(X$var2 >8),]*
  *sort(X,decreasing=TRUE)*
  *sort(x$var2,na.last=TRUE)*
  *order()*, X[order(X$var1,X$Var3),]

- Ordering with plyr
  **Plyr** 程序包 *arrange(X,desc(var1))*

### Look at data summary ###
- summary() 查看数据的情况
- str()     数据组情况class 等
- quantile(data,na.rm=TRUE,probs=c(0.5,0.75,0.9))  看数据分布情况
- head()
- tail ()

- Checking for missing values

  - *all*, *any*, *is*
  - *table(data, %in%, c)*, %in% in 等于
  - *xtabs(formula(Freq,sum)~var2+var3, dataset)*, 对dataset里的数据做table，var1是数据。

### Creating New Data ###

  - *seq(1:10,by=2)*
  - *ifelse()* creating binary variables
    ```
    ifelse(restData$zipcode<0,TRUE,FALSE)
    ```

    - creating categorical variables *cut(dataset, breaks=quantile())*
    - creating factor variables *factor()*
    - *as.numeric()*

    - *mutate*
    - *abs*
    - *ceiling* (3.75)=4
    - *round* 小数点后几位
    - *floor* 向下取整
    - *signif（x,digits=n)* 有效数字

### Reshaping the Data ###

**library(reshape2)**
- Melting data frames
  *melt(data,id=c("",""),measure.vars=c("",""))*
  调整数据每个观测是一行
- Casting data frames
  *dcast(data, id ~ variable,function)*
- Averaging values
  *tapply(rowCal,Index,function)*
- Split
   *split(rowCal,Index)*
   *unlist()*

### dplyr package ##

**dplyr Verbs**

- *select*, return a subset of the columns of a data frame
    select(X,1:5) 选取1：5列
    select(X,row1:row5) 选取row1到row5
- *filter*, extract a subset of rows based on logical conditions
    filter(X,expression)
- *arrange(X,var1,var2)*, reoder rows of a data frame    
- *rename(X,var1new=var1, var2new=var2)*,
- *mutate*, add new variables/columns or transform existing variables
    mutate(X,varnew=expression)
- *group_by(X,var)*,
- *summarise/summarize*, generate summary statistics of different variables in the data frame
   summarize(Index,var1,var2,var3)

### Merging Data ###

merge(datasetX,datasetY,by.x="var1",by.y="var2",all=TRUE)

Using join in the plyr package
```
  df1 = data.frame(id=sample(1:10),x=rnorm(10))
  df2 = data.frame(id=sample(1:10), y=rnorm(10))
  arrange(join(df1,df2),id)
```
for Multiple dataframe
  dfList=list(df1,df2,df3)
  join_all(dfList)

### Editing Text Variables ###

- *tolower()*  全部小写字母
- *toupper()*
- *strsplit(x,"\\.")*
- *sapply*
- *sub("org","new",X)* 替换文本字符
- *gsub("org","new",X)* replace all with new
- *grep("search str",X)*,*grepl()*. finding values, grep() return vectors, while grepl() return Logial expression, with value=TRUE agruement, grep will return the value itself.

**library(stringr)**
- *nchar("")* length of the str.
- *substr("",1,7)*
- *paste("","", sep=)*
- *paste0()*
- *str_trim("")*, 去掉多余的空格

### Regular Expressions ###

^ *the beginning of the line*
$ *the end of the line*
[Bb][Ub][Ss][Hh] *whatever Bush*
[a-z], [a-zA-Z],[0-9] *any lower case letter, any letter, any numbers*
[^?.]$, *^* means not, will match any lines that end up without ? or .
. *coule be any character*
flodd|fire, *any*
[Gg]eorge ([Ww]\.)? [Bb]ush ？optional
" * " repeat any times
"+" at least one of the item
{ } match times max and min

### Date and Time ### 
