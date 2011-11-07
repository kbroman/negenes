
README file for the negenes package
----------------------------------------------------------------------
This explains the installation of the negenes package for R.  If you
have any problems with installation, send an email to Karl Broman
<kbroman@biostat.wisc.edu>.
----------------------------------------------------------------------

OBTAINING R

  You can download R from the Comprehensive R Archive Network (CRAN).
  Visit http://cran.r-project.org or a local mirror (for example,
  http://cran.us.r-project.org).  Source code is available for Unix,
  and binaries are available for Windows, MacOS, and many versions of
  Linux.  


OBTAINING R/NEGENES

  You can obtain the latest version of R/negenes from 

      http://www.biostat.wisc.edu/~kbroman/software/negenes.html

  Copies of R/negenes will also be placed on CRAN
  (cran.r-project.org), but the version at the above site will be
  updated more frequently.  Binaries are available for Windows and
  MacOS; source code is available for Unix.


INSTALLATION OF R AND R/NEGENES (Windows)

  1. The Windows version of R is distributed as a single file,
     with a name something like R-2.12.1-win32.exe.  Install R by executing
     this file.  We recommend installing R in "c:\R" rather than
     "c:\Program Files\R".  Why didn't Microsoft use "Programs" rather
     than "Program files"? 

 2. To install R/qtl, the simplest approach is to start R and type

         install.packages("negenes")

     This will download the binary from CRAN and install it.

     Alternatively, you can download the "negenes_0.98-9.zip" (or the
     equivalent).  Then start R and select (on the menu bar)
     "Packages" and then "Install package from local zip file...".
     Find the file "negenes_0.98-9.zip" on your hard drive, and click
     "Open".


INSTALLATION OF R AND R/NEGENES (MacOS version 10.2.x and above)

  1. Download the file R-2.12.1.dmg and double-click it to mount a
     "drive" with a name something like "R-2.12.1".  Follow the
     instructions in the file "ReadMe.txt".

  2. To install R/qtl, the simplest approach is to start R and type

         install.packages("negenes")

     This will download the binary from CRAN and install it.

     Alternatively, download the compiled version of R/qtl for 
     Mac OS X, a file like "negenes_0.98-9.tgz".  Then start R and 
     select (on the menu bar) "Packages & Data" -> "Package 
     Installer".  Select "Local Binary Package" from the drop-down 
     menu at the top of the window that comes up.  Click "Install"
     at the bottom of the window.  Find the package on your drive 
     and click "Open".  Finally, close the window.


INSTALLATION OF R/NEGENES (Unix)

  1. We'll assume that R has already been installed. 

  2. Go into the directory containing the file "negenes_*.tar.gz".

  3. Do one of the following:

     a. To install R/negenes in the standard location
        (/usr/local/lib/R/library), type 

            R CMD INSTALL negenes_*.tar.gz

        You'll probably need to be superuser.

     b. To install the package locally, type 

            R CMD INSTALL --library=/home/auser/Rlibs negenes_*.tar.gz

        (where "/home/auser/Rlibs" should be replaced with the
        appropriate directory).  

        Create a file ~/.Renviron containing the line

            R_LIBS=/home/auser/Rlibs

        so that R will know to search for packages in that directory.


GETTING STARTED

  Once you start R, you'll need to type "library(negenes)" to load the
  package.  You can create a file "~/.Rprofile" (Unix or MacOS) or
  "c:\.Rprofile" (Windows) containing R code to be run whenever you
  start R.  If you use the R/negenes package regularly, you should
  place the line "library(negenes)" in such a file.

  To get started with R/negenes, you might first peruse the
  documentation that is bundled with it.  Type help.start() to start
  the html version of the R help pages.  Then click "Packages" ->
  "negenes".

  In Windows or MacOS, you may gain access to the help documents by
  clicking "Help" in the menu bar and then "R language (html)".  If
  you include "options(htmlhelp=TRUE)" in your .Rprofile file, use of
  the html version of the help pages will be automatic.


QUESTIONS/COMMENTS/CONCERNS

  If you have any questions, suggestions, problems or complaints
  regarding R/negenes, please email Karl Broman <kbroman@biostat.wisc.edu>.
  
----------------------------------------------------------------------
end of README.txt
