SUBDIRS = .

perlrun = @PERL@

if RPM_BUILD_MODE
perlwc = \#
else
perlwc = @PERL@ -wc
endif

perl5libdir = @perl5libdir@
ax_perl5_extra_includes_opt = @ax_perl5_extra_includes_opt@

# this is where we will install these perl modules
amazondir = @perl5libdir@/Amazon
amazoncloudwatcheventsdir = ${amazondir}/CloudWatchEvents

AMAZONMODULES = \
    Amazon/CloudWatchEvents.pm.in

AMAZONCLOUDWATCHEVENTMODULES = \
    Amazon/CloudWatchEvents/Event.pm.in

GAMAZONMODULES = $(AMAZONMODULES:.pm.in=.pm)
GAMAZONCLOUDWATCHEVENTMODULES = $(AMAZONCLOUDWATCHEVENTMODULES:.pm.in=.pm)

amazon_DATA = $(GAMAZONMODULES)
amazoncloudwatchevents_DATA = $(GAMAZONCLOUDWATCHEVENTMODULES:pm.in=.pm)

dist_noinst_DATA = \
    $(AMAZONMODULES) \
    $(AMAZONCLOUDWATCHEVENTMODULES)

@do_subst_command@

if USING_PERL5_EXTRA_INCLUDES
PERL5_EXTRA_INCLUDES = $(ax_perl5_extra_includes_opt)
else
endif

# Please see the notes concerning PERLINCLUDE in the ../bin/Makefile.am file
PERLINCLUDE = \
   -I $(builddir) \
   $(PERL5_EXTRA_INCLUDES) \
   -I $(perl5libdir) 

$(GAMAZONMODULES): % : %.in $(GAMAZONCLOUDWATCHEVENTMODULES)
	test -d "$$(dirname "$@")" || $(INSTALL) -d "$$(dirname "$@")"
	$(do_subst) $< > $@
	$(perlwc) $(PERLINCLUDE)  $@ || { ret=$?; rm $@ && exit $ret; }

$(GAMAZONCLOUDWATCHEVENTMODULES): % : %.in 
	test -d "$$(dirname "$@")" || $(INSTALL) -d "$$(dirname "$@")"
	$(do_subst) $< > $@
	$(perlwc) $(PERLINCLUDE)  $@ || { ret=$?; rm $@ && exit $ret; }

all:

CLEANFILES = $(GAMAZONMODULES) $(GAMAZONCLOUDWATCHEVENTMODULES)
