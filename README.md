# README

This is the README file for the `perl-Amazon-CloudWatchEvents` project...

# See perldoc Amazon::CloudWatchEvents

# Installation

```
git clone https://github.com/rlauer6/perl-Amazon-CloudWatchEvents.git
cd perl-Amazon-CloudWatchEvents
./configure --with-perl5libdir
sudo make && sudo install
```

# Build an RPM

```
git clone https://github.com/rlauer6/perl-Amazon-CloudWatchEvents.git
cd perl-Amazon-CloudWatchEvents
./configure --with-perl5libdir
make dist && rpmbuild -tb $(ls -t perl-Amazon-CloudWatchEvents*.tar.gz | head -1)
```

# Author

Rob Lauer  <rlauer@signatureinfo.com>
