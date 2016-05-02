##created by Ge Pu, gp86@drexel.edu
##this code computes traffic through tomtom traffic api
urlcreate<-function(p1,p2,pr1,pr2,pr3,pr4,pr5,pr6,pr7,pr8,pr9,pr10)
{
  ch1<-'https://api.tomtom.com/lbs/services/route/3/'
#please regrister your key first at http://developer.tomtom.com/member/register
  ch2<-'/Quickest/json?key=ENTER YOUR KEY HERE'
  points<-paste(p1,p2,sep=':')
  pr1 <- paste('&avoidTraffic=', pr1, sep = '')
  pr2 <- paste('includeTraffic=', pr2, sep = '')
  pr3 <- paste('language=', pr3, sep = '')
  pr4 <- paste('day=', pr4, sep = '')
  pr5 <- paste('time=', pr5, sep = '')
  pr6 <- paste('iqRoutes=', pr6, sep = '')
  pr7 <- paste('trafficModelID=', pr7, sep = '')
  pr8 <- paste('avoidTolls=', pr8, sep = '')
  pr9 <- paste('includeInstructions=', pr9, sep = '')
  pr10 <- paste('pathPoints=', pr10, sep = '')
  backurl <- paste(pr1,pr2,pr3,pr4,pr5,pr6,pr7,pr8,pr9,pr10, sep = '&')
  furl<- paste(ch1,points,ch2,backurl, sep='')

out<-fromJSON(file=furl)
DelayT<-out$route$summary$totalDelaySeconds/60
TotalT<-out$route$summary$totalTimeSeconds/60
Timestamp<-Sys.time()
return(data.frame(Timestamp,DelayT,TotalT))

}
#Please find the gps coordinates of your first point and last.
furl<-urlcreate('ENTER YOUR FIRST POINT',
                'ENTER YOUR SECOND POINT',
                'true','true','en','today','now','2','-1','false','false','6')
