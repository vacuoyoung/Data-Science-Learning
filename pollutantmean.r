#R Programming Week2-Assignment 1 

#main function 

pollutantmean<-function(directory,pollutant,id=1:332){
    
    #now get the single point data 
    PMS<-function(directory,pollutant,id){
        if(id<10){
            FN<-paste("00",id,".csv",sep = "")
        }
        else if(id<100){
            FN<-paste("0",id,".csv",sep = "")
        }
        else{
            FN<-paste(id,".csv",sep = "")
        }
        temp<-read.csv(file = FN)
        temp2<-temp$pullutant
        temp3<-temp2[!is.na(temp2)]
        mean(temp3)
    }
    
    #now loop within id and calculate the meanvalue 
    pollutant<-vector(length = length(id))
    t<-1
    for(i in id){
        pollutant[t]<-PMS(directory,pollutant,i)
        t+1
    }
    mean(pollutant)
}






