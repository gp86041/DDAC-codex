deathbyyear<-deathbyyear[1:15,]
MinTemp<-MinTemp[1:15,]
MinTemp[,1]<-(1999:2013)
deathbyyear<-deathbyyear[,2:6]
deathbygender<-`Multiple.Cause.of.Death,.1999.2013.(2)`
rm(`Multiple.Cause.of.Death,.1999.2013.(2)`)
deathbyage<-`Multiple.Cause.of.Death,.1999.2013.(1)`
rm(`Multiple.Cause.of.Death,.1999.2013.(1)`)
