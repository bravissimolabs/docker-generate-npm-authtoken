#!/usr/bin/expect

set timeout 20

set cmd [lindex $argv 0]
set username [lindex $argv 1]
set password [lindex $argv 2]
set email [lindex $argv 3]
set two_f_a_code [lindex $argv 4]

eval spawn $cmd

expect "Username: "
send "$username\r";

expect "Password: "
send "$password\r";

expect "Email: (this IS public) "
send "$email\r";

if { $two_f_a_code != "" } {
  expect "Enter one-time password from your authenticator app: "
  send "$two_f_a_code\r"
}

expect eof

puts $expect_out(buffer)
