##FOLLOWING SCRIPT IS FOR BLUE AND GOLD ROUTE TIME APPROXIMATION
##CONTACT ME AT gp86@drexel.edu WITH ANYQUESTIONS YOU MIGHT HAVE USING THIS
###function for five points on map

urlcreate5<-function(p1,p2,p3,p4,p5,pr1,pr2,pr3,pr4,pr5,pr6,pr7,pr8,pr9,pr10)
{
  ch1<-'https://api.tomtom.com/lbs/services/route/3/'
 ##GET YOUR OWN DEVELOPER KEY ON TOMTOM DEVELOPER WEBSITE
  ch2<-'/Quickest/json?key=ENTER YOUR OWN KEY HERE'
  points<-paste(p1,p2,p3,p4,p5,sep=':')
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
DelayT<-out$route$summary$totalDelaySeconds
TotalT<-out$route$summary$totalTimeSeconds
Timestamp<-Sys.time()
return(data.frame(Timestamp,DelayT,TotalT))
}

###function for three points on map

urlcreate3<-function(p1,p2,p3,pr1,pr2,pr3,pr4,pr5,pr6,pr7,pr8,pr9,pr10)
{
  ch1<-'https://api.tomtom.com/lbs/services/route/3/'
 ##GET YOUR OWN DEVELOPER KEY ON TOMTOM DEVELOPER WEBSITE
  ch2<-'/Quickest/json?key=ENTER YOUR OWN KEY HERE'
  points<-paste(p1,p2,p3,sep=':')
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
  DelayT<-out$route$summary$totalDelaySeconds
  TotalT<-out$route$summary$totalTimeSeconds
  Timestamp<-Sys.time()
  return(data.frame(Timestamp,DelayT,TotalT))
  
}

##CREATE URLS

f1<-urlcreate5('39.956410,-75.194895',
              '39.957438,-75.187876',
                '39.957578,-75.189120',
                '39.960361,-75.189445',
                '39.964224,-75.190172',
                'true','true','en','today','now','2','-1','false','false','6')

f2<-urlcreate5('39.964224,-75.190172',
              '39.963731,-75.194517',
              '39.959875,-75.193790',
              '39.959505,-75.197159',
              '39.953642,-75.198728',
                'true','true','en','today','now','2','-1','false','false','6')

f3<-urlcreate5('39.953642,-75.198728',
              '39.954875,-75.208792',
              '39.958592,-75.208030',
              '39.959727,-75.195252',
              '39.962447,-75.195791',
                'true','true','en','today','now','2','-1','false','false','6')

f4<-urlcreate3('39.962447,-75.195791',
              '39.962937,-75.191387',
              '39.955809,-75.191490',
              'true','true','en','today','now','2','-1','false','false','6')

#5*60 is loading and unloading students

DelayT<-f1[,2]+f2[,2]+f3[,2]+f4[,2]+5*60
TotalT<-f1[,3]+f2[,3]+f3[,3]+f4[,3]+5*60
Timestamp<-Sys.time()
result<-data.frame(Timestamp,DelayT,TotalT)
