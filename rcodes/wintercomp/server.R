shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    plot(x = MinTemp[1:input$n,1], y = MinTemp[1:input$n,2],
         type="l",
         col="blue",
         main="Hypothermia Death Toll vs. Annual US Mean Temperature Minimum per Year",
         ylab="Tempreture (F)",
         xlab="Year")
    abline(lm(MinTemp[1:input$n,2]~MinTemp[1:input$n,1]),col="red", lwd=3)
    par(new=TRUE)
    plot(x = MinTemp[1:input$n,1], y = deathbyyear[1:input$n,3],type="l",
         yaxt="n",ylab="",lwd=4,xlab="")
    axis(4)
    mtext("US Hypothermia Death Toll",side=4,line=-1.5)
    legend("topleft",
           lwd=c(1,3,4),
           col=c("blue","red","black"),
           c("Temperature","Tendline for Temperature","Hypothermia Death"))
  })
  output$plot2<-renderPlot({
    colors <- c("orange",
                "cyan")
    labels <- round(deathbygender[,4]/sum(deathbygender[,4]) * 100, 1)
    labels <- paste(labels, "%", sep="")
    pie(deathbygender[,4],labels=labels,main="Death by Gender",col=colors,)
    legend(-0.5, 0.5, c("Female",    
                       'Male'), cex=0.8, fill=colors)
  })
  output$plot3<-renderPlot({
    colors <- c("white",
                "green",
                "blue",
                "red",
                "yellow",
                "grey20",
                "grey",
                "tan",
                "purple",
                "orange",
                "grey40")
    labels <- round(deathbyage[,4]/sum(deathbyage[,4]) * 100, 1)
    labels <- paste(labels, "%", sep="")
    mtext(labels, line = 5)
    pie(deathbyage[,4],label=labels,col=colors, main="Death by Age Groups", radius=1)
    legend("bottomleft", c("< 1 year",    
                       '1-4 years',   
                       '5-14 years',  
                       '15-24 years', 
                       '25-34 years' ,
                       '35-44 years',
                       '45-54 years',
                       '55-64 years',
                       '65-74 years', 
                       '75-84 years', 
                       '85+' ), cex=0.8, fill=colors)
  })
})