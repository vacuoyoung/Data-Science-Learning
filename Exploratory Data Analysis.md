### Lesson 1 Graphs

**Principles of Analytic Graphics**
1. show cpmparisons
2. show causality, mechnism
3. Show multivariate data
4. Integration of evidence
5. Describe and document the evidence with appropriate labels, scales, sources. etc
6. Content is king

**Exploratory Graphs**

  - *summary()*
  - *boxplot(data,col=“”)*
  - *hist(data,col="",breaks=...)*
  - *rug()*
  - Overlaying, *abline(a,b,h=,v,lwd=,lty=)*
  - *barplot()*

  - scatterplot, *plot(a,b)*

  **Plotting System**
  - base plotting system
  - lattice system (xyplot, bwplot) from lattice pacakge
  - ggplot2

  **Base plotting system**

  - *boxplot(a~b)*
  - Base Graphics Parameters,
    - *pch* ( the plotting symble)
    - *lty*, line type
    - *lwd*, the line width
    - *col*, color
    - *xlab*, x-axis label
    - *ylab*, y-axis label

- par() , specify global Graphics Parameters
  - *las*, the orientation of the axis labels on the plot
  - *bg* background color
  - *mar*, the margin size
  - *oma*, the outer margin size
  - *mfrow*, number of plots per row, column
  - *mfcol*, number of plots per row, colum

  - Base plotting functions
    - *plot*, make a scatterplot
    - *lines*, add lines to a plot
    - *point*, add points to a plot
    - *text*, add text labels to a plot using specified x, y coordinates
    - *mtext*, add arbitrary text to the margins
    - *axis*, adding axis ticks/labels

 - 添加图例，legend("topright", pch=1, col=c("blue","red"),legend=c("",""))
 - 添加回归曲线, model<- lm(Ozone~Wind, airquality), abline(model, lwd=2)

**Graphics Devices in R**

Vector formats,

  - *pdf*, pdf(file="")
    dev.off()
  - *svg*, XML-based
  - *win.metafile* , windows metafile format
  - *postscript* , older format, also resized well

Bitmap formates,

    - *png*,
    - *jepg*, good for photographs or natural scence  
    - *tiff*
    - *bmp*, a native Windows bitmapped format

dev.cur(), dev.set(<integer>) 切换显示屏幕

Copying Plots
  - *dev. copy*, copy a plot from one device to another
  - *dev.copy2pdf*, 
