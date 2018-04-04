library(gridExtra)
library(ggplot2)

#only the heat_scatter
plot_heat_simple<-function(a,b,biaoti){ #a,b are both vectors, means x's axis & y's
  commonTheme = list(labs(title=biaoti,color="Density",fill="Density",
                          x="daiding",
                          y="daiding2"),
                     theme_bw(),
                     theme(legend.position=c(0,1),
                           legend.justification=c(0,1)))
  testh<-data.frame(a,b)
  ggplot(data = testh,aes(a,b))+
    stat_density2d(aes(fill=..level..,alpha=..level..),geom='polygon',colour='black') + 
    scale_fill_continuous(low="green",high="red") +
    geom_smooth(method=lm,linetype=2,colour="red",se=F) + 
    guides(alpha="none") +
    geom_point() +commonTheme
  
}

#both the heat_scatter & distribution
plot_heat<-function(a,b,biaoti){
  main_heat<-plot_heat_simple(a,b,biaoti)
  
  hist_top <- ggplot()+
    geom_histogram(aes(a),colour='black',fill='gray',binwidth = 0.3)+
    theme_void()
  
  hist_right <- ggplot()+
    geom_histogram(aes(b),colour='black',fill='gray',binwidth = 0.3)+
    theme_void() + coord_flip()
  
  empty<-ggplot()+theme_void()
  
  re<-grid.arrange(hist_top, empty,main_heat,hist_right,
               ncol=2, nrow=2, widths=c(6,1), heights=c(1,6))

}
