# R Programming #

## Writing Code ##
**getwd()** get current working directory
**source()** load R Script

## Getting started and R Nuts and Bolts ##

**Input**,
  1. <-, 赋值符号
  2. ##， 右侧都是注释，会被忽视
  3. : , x<-1:20, 构建x是一个包含1到20的数组

**R Objects and Attributes**
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
在R中，数据被当作实数处理，除非后面用 **L** 标记

对象的另外一个属性，是attribute, **attributes()**
可以用C（concatenate）作为连接赋值。将被赋值最低公共类型

**Class** 函数识别对象类型，**as.complex()** 强制类型转换

**Metrices** 矩阵，具有*dimension*这个*attributes*,
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

**Factors**, 记录分类数据
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
 *attributes*, row.names
 read.table() or read.csv()
 data.matrix()
 data.frame(foo=1:4,bar=c(T,T,F,F))

 R的对象可以拥有 **Names**,
 ```names(x)<-c('f','b','c')
 x<-1:3
 ```
**list**, list(a=1,b=2,c=4)
 **matrix** dimnames("matrix")<-List(c("rowname",c("col name"))
