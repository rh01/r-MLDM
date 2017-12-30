# Math, Variables, and Strings

# Installation of R kernal
install.packages('devtools')

#depends
install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))
devtools::install_github('IRkernel/IRkernel')
# install.packages('repr','IRdisplay', 'pbdZMQ', 'crayon', 'uuid')
# or devtools::install_local('IRkernel-master.tar.gz')
IRkernel::installspec()  # to register the kernel in the current R installation

# in R 3.3
IRkernel::installspec(name = 'ir33', displayname = 'R 3.3')
# in R 3.2
IRkernel::installspec(name = 'ir32', displayname = 'R 3.2')