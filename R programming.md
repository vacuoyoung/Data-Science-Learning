# R Programming #

### Writing Code ###
**getwd()** get current working directory
**source()** load R Script

### Getting started and R Nuts and Bolts ###

**Input**,
  1. <-, 赋值符号
  2. ##， 右侧都是注释，会被忽视
  3. : , x<-1:20, 构建x是一个包含1到20的数组

**R Objects and Attributes**b
R has 5 basic classes of objects
    1. character
    2. numeric(real number)
    3. integer
    4. complex
    5. logical(True/False)

R语言里最基本的对象是向量（**Vector**), Vector 可以包含多个同一类型的对象，但是不能包含不同的类型的对象
Empty vectors can be created with the **Vector()** function

```
  x<-vector("List",length=10)
```


但是 **list** 可以包含多种类型

**Inf** & **-Inf** infinity
**NaN** 代表未定义数值 not a number
**NA** 是个未有数值的占位符
在R中，数据被当作实数处理，除非后面用 **L** 标记

对象的另外一个属性，是attribute, **attributes()**
可以用C（concatenate）作为连接赋值。将被赋值最低公共类型

**Class** 函数识别对象类型，**as.complex()** 强制类型转换

**Metrices** 矩阵，具有*dimension*这个*attributes*, 所以给一个普通的vector 赋予dim（）就成为了矩阵，但是矩阵只能存储同一类数据
```
m<-matrix(nrow=2,ncol=3)
dim(m)
attributes(m)

m<-matrix(1:12,nrow=3,ncol=4)
```
*or*
```
m<1:10
dim(m)<-c(2,5)
```
or *cbind-ing* or *rbind-ing*
```
x<-1:3
y<2:4
cbing(x,y)
rbing(x,y)
```

**Factor**, 记录分类数据
```
X<-facotr(c('yes','no,'yes))
table(x)
unclass(x)
attributs(x) level
```
level 是默认按照字母顺序排列的，所以No是比Yes更前面的level，除非通过levels参数claim，*levels=c("yes","no")

**Missing Values**, **NaN** or **NA**

**is.na()** 判断是不是Na
**is.nan()** 判断是不是NaN
 NaN是NA的一种，NaN是不是数值数据，NA是不是数据

 **Data Frames**, 数据框可以存储不同类型的数据。
 Frame类型有 *attributes*,
 - row.names
 - read.table() or read.csv()
 - data.matrix() 构建一个matrix类型
 - data.frame(foo=1:4,bar=c(T,T,F,F))
 - colnames()<-c()


R的对象可以拥有 **Names**,
 ```
 names(x)<-c('f','b','c')
 x<-1:3
 names(x)
 ```
- **list**,
```
list(a=1,b=2,c=4) or
names(list)<-c()
```

- **matrix**
```
dimnames("matrix")<-List(c("rowname",c("col name"))
```

**Read Tabular Data**
- read.table(), contains arguments below,
  - *file*,
  - *header*,logical indicating if the file has a header line
  - *sep*,a string indicating how the columns are seperated
  - *colClasses*,
  - *nrows*
  - *comment.char*
  - *skip*,the number of lines to skip from the beginning
  - *stringsAsFactors*, should character variables be coded as factors.
- read.csv() is identical except that default separator is a comma, while read.table() is space.
- 读取较大数据量的数据时候，注意，设定 comment.char='' 如果不包含任何注释页面，同时确认 *colClasses* 可以增加阅读速度
```
initial<-read.table("database.txt",nrows=100) #读前100行
classes<-sapply(initial,class) #返回数据类型
tabAll<-read.table('database.txt',colClasses=classes)
```

**Textual Format**

- *dump* & *dput* 是两个主要的输出函数，输出文本格式，对frame类型的数据使用dump和dput函数，会包含每一类的数据类型，包含元数据。
- *source* 和 *dget* 可以读取未经dump和dput输出的数据
- *dput* 生成了一些R代码，这些代码可以用来重新构建R对象
```
 dput(y,file="y.R")
 dget("y.R")
 ```
 *dump* 类似于 *dput*, 区别是dump可以被用于多个R对象
 ```
 x<-"foo"
 y<-data.frame(a=1,b=2)
 dump(c("x","y"),file="data.R")
 ```

**Interfaces to the outside world**
- *file*
- *gzfile*, opens a connection to a file compressed with gzip
- *bzfile*, with bzip
- *url*

  - r, w, a reading, writing, appending
  - rb, wb, ab, reading, writing, appending in a binary mode
- *readLines(filename,nrows)*, 阅读指定文件的前若干行
- *writeLinesF(filename,nrows)*,写入
```
   > con<-url("https://www.jhsph.edu","r")
   > x<-readLines(con)
   > head(x) ##输出该rul的html的head部分
```
**Subsetting**
- "[]", x[1],x[x>6]
- "[[]]", from list or frame
- "$", name
- subset(x,expression, select="") ## 数据源，逻辑判断，返回的列。

```
>x-<list(foo=1:4,bar=0.6)
>x[1] ##retrun list foo
>x[[1]] ##return sequence 1:4
>x$bar ##return 0.6
>x[['bar']] ##return 0.6
x['bar'] ##return $bar 0.6
```
用[]提取 list，返回list，用[[]]返回value

Matrix can be subsetted in the usual way with [i,j]
对矩阵来说，用[]取子集，会返回vector，如果需要矩阵，那么需要set attributes *x[1,0,drop=FALSE]*

**Partial Matching**
```
x<-list(aardvark=1:5)
x$a  ##自动返回最符合的
x[["a"]] ##必须精准匹配
X[["a",exact=FALSE]] ##关闭精确匹配
```

**removing NA Values**
```
bad<-is.na(x) ##返回逻辑值
x[!bad] ##去掉为True的
```
If there are multiple things that contains NA.
```
x<-c(1,2,NA,4,5,NA)
y<-c("a","b","c",NA,NA)
good<-complete.cases(x,y) ##返回x和y都不是NA的数值
```

**Vectorized Operation**
- *x+y*, 依次向量相加
- *x>2*,
- *x*y*
- *x/y*

**Vectorized Matrix Operation**
对矩阵的操作类似，也是vector相互操作，**%*%** 才是矩阵

###Swirl###

- type **?c**,会弹出帮助文件，不需要括号
- list all the objects in your local workspace using **ls()**
- **dir.create**在现有文件夹create 文件
- **file** .create, rename, remove, info, exists, create, copy, path(构建文档路径)
- **setwd** 设定工作文件夹


**seq**,
```
seq(0,10,0.5) # from 1 to 10, 步长0.5
seq(0,10,length=10) #数组长度10
seq(along.with=vector) #长度和vector一样
seq_along(vector) #内置函数，同上
rep(0,times=40)
rep(c(0,1,2,3),each=5)
```

**paste**
```
paste(strings, collapse" "), ##
```

**Subsetting**
*index vectors*, 4 types,
- logical, is.na()
- positive integer
- negtive integer  ## remove only those vectors
- named elements
