# mar-oma (and mfrow/mfcol) example
# efg, Stowers Institute, 21 July 2005

GenericFigure <- function(ID, size1, size2)
{
  plot(0:10, 0:10, type="n", xlab="X", ylab="Y")
  text(5,5, ID, col="red", cex=size1)
  box("plot", col="red")
  mtext("Figure",
        SOUTH<-1, line=3, adj=1.0, cex=size2,   col="blue")
}


# Figure 1.  Default R Plot Area / Figure Area
Figure1 <- function()
{
  oldpar <- par(oma=c(0,0,0,0))  # default values
  GenericFigure("Plot Area", 3,2)
  box("figure", col="blue")
  par(oldpar)
}

# Figure 2A.  R Plot Area / Figure Area with Outer Margin Area present
Figure2A <- function()
{
  par(oma=c(2,2,2,2))
  GenericFigure("Plot Area", 3,2)

  Margins <- capture.output( par()$mar )
  Margins <- substr(Margins, 5, nchar(Margins))
  Margins <-
       paste("mar = c(", gsub(" ",",",Margins), ")", sep="")
  mtext(Margins,
        NORTH<-3, line=2, adj=0.0, cex=1.5, col="blue")

  # "figure" box and "inner" margin box same for single figure plot
  box("figure",lty="dashed", col="blue")
  box("inner", lty="dotted", col="green")

  mtext("Outer Margin Area",
        SOUTH<-1, line=0.4, adj=1.0, cex=1.5, col="green", outer=TRUE)
  box("outer", lty="solid", col="green")

  OuterMargins <- capture.output( par()$oma )
  OuterMargins <- substr(OuterMargins, 5, nchar(OuterMargins))
  OuterMargins <-
       paste("oma = c(", gsub(" ",",",OuterMargins), ")", sep="")
  mtext(OuterMargins,
        NORTH<-3, line=0.4, adj=0.0, cex=1.5, col="green", outer=TRUE)
}

# Figure 2B.  Additional Annotations.
Figure2B <- function()
{
  Figure2A()

  # Text:  one string per mtext call
  mtext("mar[SOUTH<-1]", SOUTH<-1, at=5, line=2,    cex=1.2, col="blue")
  mtext("mar[WEST<-2]",  WEST <-2, at=5, line=2,    cex=1.2, col="blue")
  mtext("mar[NORTH<-3]", NORTH<-3, at=5, line=0.25, cex=1.2, col="blue")
  mtext("mar[EAST<-4]",  EAST <-4, at=5, line=0.25, cex=1.2, col="blue")

  # Text:  vector of strings in mtext call
  mtext(c("oma[SOUTH<-1]", "oma[WEST<-2]", "oma[NORTH<-3]", "oma[EAST<-4]"),
        c(SOUTH<-1, WEST<-2, NORTH<-3, EAST<-4),
        line=0.4, cex=1.2, col="green", outer=TRUE)
}

MultipleFigures <- function()
{
  GenericFigure("1", 3,1)
  box("figure", lty="dotted", col="blue")

  GenericFigure("2", 3,1)
  box("figure", lty="dotted", col="blue")

  GenericFigure("3", 3,1)
  box("figure", lty="dotted", col="blue")

  GenericFigure("4", 3,1)
  box("figure", lty="dotted", col="blue")
}

# Figure 3A.  Using Multiple Figures.
Figure3A <- function()
{
  par(mfrow=c(2,2), mar=c(5.1,4.1,4.1,2.1), oma=c(0,0,0,0))

  MultipleFigures()
  box("inner", lty="dotted", col="green")
  box("outer", lty="solid", col="green")
}

# Figure 3B.  Using Multiple Figures with outer margin area
Figure3B <- function()
{
  par(mfcol=c(2,2), mar=c(4,4,0.5,0.5), oma=c(1.5,2,1,1))

  MultipleFigures()
  box("inner", lty="dotted", col="green")

  mtext("Outer Margin Area",
        SOUTH<-1, line=0.2, adj=1.0, cex=1,   col="green", outer=TRUE)
  mtext("Title Line",
        NORTH<-3, line=0,   adj=0.5, cex=1.2, col="red",   outer=TRUE)

  box("outer", lty="solid", col="green")
}
