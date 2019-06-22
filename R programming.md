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
