add2 <- function(x, y) {
  x + y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n = 7) {
  use <- x > n
  x[use]
}

make.power <- function(n) {
  pow <- function(x){
    x^n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)

y<-10

f <- function(x) {
  y<-2
  y^2 + g(x)
}


g <- function(x) {
  x*y
}

cube <- function(x, n) {
  x^3
}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}