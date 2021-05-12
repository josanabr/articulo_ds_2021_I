
#!/bin/tclsh
proc runtimer { seconds } {
set x 0
set timerstop 0
while {!$timerstop} {
incr x
after 1000
  if { ![ expr {$x % 60} ] } {
          set y [ expr $x / 60 ]
          puts "Timer: $y minutes elapsed"
  }
update
if {  [ vucomplete ] || $x eq $seconds } { set timerstop 1 }
    }
return
}
puts "SETTING CONFIGURATION"
dbset db mysql
diset connection mysql_host 127.0.0.1
diset connection mysql_port 3306
diset connection mysql_socket /var/run/mysqld/mysqld.sock
diset tpcc mysql_driver timed
diset tpcc my_duration 5
diset tpcc pg_vacuum true
print dict
vuset logtotemp 1
loadscript
puts "SEQUENCE STARTED"
foreach z { 1 2 4 8 16 32 64 } {
puts "$z VU TEST"
vuset vu $z
vucreate
vurun
runtimer 10000
vudestroy
after 5000
        }
puts "TEST SEQUENCE COMPLETE"
exit
