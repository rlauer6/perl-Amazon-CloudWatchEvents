SUBDIRScd = .

perlrun = @PERL@

if RPMBUILD_ENABLED
perlwc = \#
else
perlwc = @PERL@ -wc
endif

# you should be using perl5libdir as the base target of your perl
# modules, not as simply part of your PERLINCLUDE
perl5libdir = @perl5libdir@
ax_perl5_extra_includes_opt = @ax_perl5_extra_includes_opt@

# this is where we will install perl scripts
libexecdir = @libexecdir@

PERLSCRIPTS = 

GPERLSCRIPTS = $(PERLSCRIPTS:.pl.in=.pl)
G1MANPAGES = $(GPERLSCRIPTS:.pl=.1sis)

libexec_SCRIPTS = $(GPERLSCRIPTS)
dist_noinst_DATA = $(PERLSCRIPTS)

man1_MANS = $(G1MANPAGES)

@do_subst_command@

if USING_PERL5_EXTRA_INCLUDES
PERL5_EXTRA_INCLUDES = $(ax_perl5_extra_includes_opt)
else
endif

PERLINCLUDE = \
    -I $(builddir) \
    -I $(builddir)/../lib \
    $(PERL5_EXTRA_INCLUDES) \
    -I $(perl5libdir)

$(GPERLSCRIPTS): % : %.in
	test -d "$$(dirname "$@")" || $(INSTALL) -d "$$(dirname "$@")"
	$(do_subst) $< > $@
	$(perlwc) $(PERLINCLUDE) $@ ||  { ret=$?; rm $@ && exit $?; }

$(G1MANPAGES): %.1sis : %.pl
	target_name="$@" ;\
	tname=$$(echo "$${target_name}" | sed -e 's/\.1sis$$//') ;\
	"$(POD2MAN)" $< \
	--center='SIS' \
	--name="$${tname}" \
	--release=$(PACKAGE)-$(VERSION) \
	--section=1sis > "$${target_name}"

.PHONY: clean-local
clean-local:
	$(MAKE) clean-generated-man-pages


.PHONY: clean-generated-man-pages
clean-generated-man-pages:
	for mpath in $(G1MANPAGES); do \
	rm -f "$${mpath}" ;\
	test $$? -eq 0 || exit 1 ;\
	done

all:

CLEANFILES = $(GPERLSCRIPTS) $(G1MANPAGES)
