;; detach from channels that nobody is talking in
;; 3 days in seconds is 259200
;; 2 days in seconds is 172800
;; 1 day in seconds is 86400
on *:join:#:{
  if ($nick == $me) {
    var %day = 259200
    .timerdetach. $+ $chan $+ . $+ $network 1 %day do.detach $chan
  }
}
on *:text:*:#:{
  var %day = 259200
  .timerdetach. $+ $chan $+ . $+ $network 1 %day do.detach $chan
}
alias do.detach {
  detach $chan
  echo -tsa You detached from $1 due to no activity for $calc(%day / 60 / 60 / 24) - To reattach: /join $1 
}
