all: provision
clean: stop delete

provision:
	sh provision.sh lxdtest

attach:
	lxc exec lxdtest -- bash

run-tests:
	sh run_tests.sh lxdtest

stop:
	lxc stop lxdtest

delete:
	lxc delete lxdtest