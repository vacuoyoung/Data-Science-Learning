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

**Metrix** 矩阵，具有*dimension*这个*attributes*, 所以给一个普通的vector 赋予dim（）就成为了矩阵，但是矩阵只能存储同一类数据
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
- Vector
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
- **read.table()**, contains arguments below,
  - *file*,
  - *header*,logical indicating if the file has a header line
  - *sep*,a string indicating how the columns are seperated
  - *colClasses*,
  - *nrows*
  - *comment.char*
  - *skip*,the number of lines to skip from the beginning
  - *stringsAsFactors*, should character variables be coded as factors.
- **read.csv()** is identical except that default separator is a comma, while read.table() is space.
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

### Swirl ###

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

### Control Structures###

**if-else**
**for**
**while**
**repeat**
**next**
**break**

### Environment ###
The default Environment for R is always the global enviroment, equal to your workspace, and then it will search the packages that loaded. the base package is always the last one to search, so you have to choose which packages loaded.
### Function###

- *formal arguements* included in the function defination
- Function arguments can be missing or might have defalt value
- R functions arguments can be matched positionally bor by name

```
f<-function(<aguements>){
   ## code block
}
```
- *lazy evaluation* arguments to functions are evaluated only as needed

**The ... Agrument**
用于extention 现有的函数的参数，省略现有的参数。
- 当不清楚有多少参数会被传递的时候也可以使用
- 这之后的参数必须精确的描述（不可使用partial matching）

### Logical Expression###
- *which*, *all*,*any*
  返回vector中数据序号，符合逻辑判断的
- *&&* and *&*, *|* and *||*,  & 和 |会循环使用vector
- xor（）强制或语句
- isTRUE()

### Function###
- typing the funtion name without ay arguments or parenthese, then the source code will show
- *argu* 可以check 函数的arguments

**lapply**，list apply, lapply returns a list of the same length as X, each element of which is the result of applying FUN to the corresponding element of X.

```
lapply(x,fun) # funcition operation on a list of items
```

**sapply**, simply version of lapply  
**vapply**, 可以规定输出格式，如果不正确，则报错

**apply**,
function(x, MARGIN,FUN,...),  #  x is a matrix, and MARGIN 是维度，1是row 2是列

**rowSums** = apply(x,1,sum)
**rowMeans** = apply (x, 1, mean)
**colSums** = apply(x, 2, sum)
**colMeans** = apply (x, 2, mean)

**mapply**, is a multivariate apply of sorts which applies a function in parallel oer a set of arguments

mapply(rep,1:4,4:1) #repeat 1:4 分别4：1次， mapply的argument数量要和要处理的数据量一样多。

**tapply**, is used to apply a function over subsets of a vector.
**vapply**, (X,Index,FUN,...), X (vector), Index (a list of 1 or more factors, same length with X)
**summary** 提供数据的统计数据，中位数等

**split**, spilt(x, f, drop = FALSE) 空是否用
interaction(f1,f2) 形成不同的level
split(x,list(f1,f2)) 不同factor层面上的split

**gl** generat factor level

**invisible**  

### Dates and Times###

**Dates** are represented by the "Date" class
**Time** are represented by the"POSIXct" and "POSIXlt"classes
Dates are stored as the number of dates since 1970-01-01, and times are stored as the seconds since 1970-01-01 (POSIXct) or a list of seconds, minutes, hours, (for POSIXlt)

```
Sys.Date() # return current date
Sys.Time() #return current time
as.Date("1969-01-01")  # give the value of 19690101
unclass() #view what's inside the vector
POSIXlt(Sys.time())  # reture the time with POSIXlt type
weekdays()  # returen 星期几
months()  # returen the month
quarters() # returen the quarter
 t4<-strptime(t3,"%B %d, %Y %H:%M") #change the string with month, date, year, hour:min into a time class
 difftime(Systime(),t1,units="days") #返回两个时间差距的units
 ```


 ### Debuging###

 **traceback**, prints out the fucntion call stack after an error occurs. 确认error出现的函数
 **debug**, flags a function for debug mode which allows you to step through execution of a function one line at a time， 写入debug，之后就可以直接调用brower，if出问题
 **browser**, suspends the exectution of a fucntion whenever its called
 **trace**, allosws u to insert degugging code into a funciton in a specific places
 **recover**, modify the error behavior so that you can brower the fuction call stack  

 **uniqe** function return a vector, data.frame, or array 去掉重复数据的。一般是针对后面的维度。
 **table** 用于把某个vector的数据转换成统计表格


**Str** 可以作为summary的函数的替代，用于现实R对象的内部结构。用于紧凑(compact display large List)

### Generating Random Numbers###

**rnorm**, 生成随机正太分布
**dnorm**, evaluate the Normal probabily density
**pnorm**, evaluate the cumulative distribution function for a Normal distribution
**rpois**, random Poisson

**r** random, **d** for density, **p** for cumulative, **q** for quantile

**set.seed()**, seed can be any integer. 生成伪随机数

**sample** (vector,No.,replacement= TRUE)
**system.time()** 放入函数块，语句等，返回执行时间
R分析器，分析R的运行时间，针对相对而言复杂的程序
Rprof() function starts the profiler in R
summaryRprof(), read the output of Rprof

### 如何针对data.Frame排序和去除NA###
subsetting data.frame by column, 会得到一个factor，那么从factor中提取vector的方式是用levels,对特定列作levels会得到所有level的名称，但是不包含重复的 *levels(dataframe[,col])*. 所以，再levevls之后要再获得全部的内容才能形成一个好的vector, *levels(data.frame[,col])[data.frame[,col]]*

ranking的话可以使用order函数
