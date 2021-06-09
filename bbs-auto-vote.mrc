;autovote for staff bulletin posts on freenode to keep it lively. only votes for staff submissions
;waits randomly 5 minutes through 45 minutes to send the vote as to not spam.

;; change "freenode" to / to vote for any user with a cloak, to avoid spam.


on *:text:*[*]*http*:#freenode-bbs:{
  var %friend = freenode

  if ($nick isop $chan) && ($network == freenode) {
    var %tw = $strip($gettok($1-,0,32))
    var %nick = $strip($left($right($strip($gettok($1-,$calc(%tw - 1),32)),-1),-1))
    var %votenum = $strip($left($right($strip($1),-1),-1))
    if (%friend isin $address(%nick,4)) {
      .timer 1 $r(300,2700) msg $chan vote %votenum
    }
  }
}
