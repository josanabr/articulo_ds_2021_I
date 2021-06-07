all: provision
clean: stop delete

provision:
	sh provision.sh lxdtest

attach:
	lxc exec lxdtest -- bash

run-tests:
	sh run_tests.sh lxdtest

push-files:
	sh push_files.sh lxdtest

pull-logs:
	sh pull_logs.sh lxdtest

stop:
	lxc stop lxdtest

delete:
	lxc delete lxdtest