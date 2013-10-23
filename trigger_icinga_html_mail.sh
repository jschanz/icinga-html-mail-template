#!/bin/bash
#
# Copyright(c) 2012 - Jens Schanz - <mail@jensschanz.de>
# http://blog.jensschanz.de
#
# this script triggers the orginial icinga_html_mail_template to avoid long interupts
# in the monitoring kernel while gathering informations and preparing the mail
#
#
# to protect the call please use the following code in notifications.cfg or where ever you store your notifications
#
#define command {
#        command_name    notifiy-by-html-email
#        command_line    /usr/local/icinga/bin/trigger_icinga_html_mail.sh "$ADMINEMAIL$" "$CONTACTEMAIL$" "$NOTIFICATIONTYPE$" "$ADMINEMAIL$" "$HOSTNAME$" "$HOSTALIAS$" "$HOSTNOTES$" "$HOSTSTATE$" "$HOSTSTATETYPE$"  "$HOSTATTEMPT$" "$MAXHOSTATTEMPTS$" "$HOSTDURATION$" "$HOSTNOTIFICATIONNUMBER$" "$HOSTCHECKCOMMAND$" "$HOSTLATENCY$" "$LASTHOSTCHECK$" "$LASTHOSTSTATECHANGE$" "$LASTHOSTUP$" "$LASTHOSTDOWN$" "$LASTHOSTUNREACHABLE$" "$HOSTOUTPUT$" "$HOSTADDRESS$" "$HOSTNOTESURL$" "$SERVICEDESC$" "$SERVICESTATE$" "$SERVICENOTIFICATIONNUMBER$"  "$SERVICEOUTPUT$" "$LASTSERVICECHECK$" "$LASTSERVICESTATECHANGE$" "$LASTSERVICEOK$" "$LASTSERVICEWARNING$" "$LASTSERVICECRITICAL$" "$LASTSERVICEUNKNOWN$" "$SERVICESTATETYPE$" "$SERVICEATTEMPT$" "$MAXSERVICEATTEMPTS$" "$SERVICEDURATION$" "$SERVICECHECKCOMMAND$" "$SERVICEDISPLAYNAME$" "$SERVICELATENCY$" "$SERVICEPERCENTCHANGE$" "$SERVICEACTIONURL$" "$SERVICENOTESURL$" "$SERVICENOTES$" "$TIMET$" "$PROCESSSTARTTIME$" "$TOTALHOSTSUP$" "$TOTALHOSTSDOWN$" "$TOTALHOSTSUNREACHABLE$" "$TOTALSERVICESOK$" "$TOTALSERVICESWARNING$" "$TOTALSERVICESCRITICAL$" "$TOTALSERVICESUNKNOWN$" "$TOTALHOSTPROBLEMSUNHANDLED$" "$TOTALSERVICEPROBLEMSUNHANDLED$" "$NOTIFICATIONAUTHOR$" "$NOTIFICATIONCOMMENT$" "2ndLevelNBO"
#}

ICINGA_MAIL_BIN="/usr/local/icinga/bin/icinga_mail.pl"
ICINGA_MAIL_LOG="/usr/local/icinga/var/icinga_mail.log"
DEBUG="0"
SMTP_HOST="127.0.0.1"
ICINGA_URL="http://icinga.jensschanz.de/icinga/"
PNP4NAGIOS_URL="http://icinga.jensschanz.de/pnp4nagios/"
NAGIOSBP_URL="http://icinga.jensschanz.de/nagiosbp/cgi-bin/nagios-bp.cgi"
NAGIOSBP_STATE="WARNING,CRITICAL,UNKNOWN"

# fire and forget icinga_mail.pl
DATE=`date`
echo "### new notification for $2 ###" >> $ICINGA_MAIL_LOG
echo "$DATE" >> $ICINGA_MAIL_LOG

# prepare >> $ICINGA_MAIL_LOG
$ICINGA_MAIL_BIN --debug $DEBUG --smtphost "$SMTP_HOST" --icinga_url "$ICINGA_URL" --pnp4nagios_url "$PNP4NAGIOS_URL" --nagiosbp_url "$NAGIOSBP_URL" --nagiosbp_state "$NAGIOSBP_STATE" --originator "$1" --recipient "$2" --notificationtype "$3" --adminemail "$4" --hostname "$5" --hostalias "$6" --hostnotes "$7" --hoststate "$8" --hoststatetype "$9" --hostattempt ${10} --maxhostattempt ${11} --hostduration "${12}" --hostnotificationnumber ${13} --hostcheckcommand "${14}" --hostlatency ${15} --lasthostcheck ${16} --lasthoststatechange ${17} --lasthostup ${18} --lasthostdown ${19} --lasthostunreachable ${20} --hostoutput "${21}" --hostaddress "${22}" --hostnotesurl "${23}" --servicedesc "${24}" --servicestate "${25}" --servicenotificationnumber ${26} --serviceoutput "${27}" --lastservicecheck ${28} --lastservicestatechange ${29} --lastserviceok ${30} --lastservicewarning ${31} --lastservicecritical ${32} --lastserviceunknown ${33} --servicestatetype "${34}" --serviceattempt ${35} --maxserviceattempts ${36} --serviceduration "${37}" --servicecheckcommand "${38}"  --servicedisplayname "${39}" --servicelatency ${40} --servicepercentchange ${41} --serviceactionurl "${42}" --servicenotesurl "${43}" --servicenotes "${44}" --timet ${45} --processstarttime ${46} --totalhostsup ${47} --totalhostsdown ${48} --totalhostsunreachable ${49} --totalservicesok ${50} --totalserviceswarning ${51} --totalservicescritical ${52} --totalservicesunknown ${53} --totalhostproblemsunhandled ${54} --totalserviceproblemsunhandled ${55} --notificationauthor "${56}" --notificationcomment "${57}" --nagiosbp_conf "${58}" >> $ICINGA_MAIL_LOG 2>&1 &

# log
echo "$ICINGA_MAIL_BIN --debug $DEBUG --smtphost \"$SMTP_HOST\" --icinga_url \"$ICINGA_URL\" --pnp4nagios_url \"$PNP4NAGIOS_URL\" --nagiosbp_url \"$NAGIOSBP_URL\" --nagiosbp_state \"$NAGIOSBP_STATE\" --originator \"$1\" --recipient \"$2\" --notificationtype \"$3\" --adminemail \"$4\" --hostname \"$5\" --hostalias \"$6\" --hostnotes \"$7\" --hoststate \"$8\" --hoststatetype \"$9\" --hostattempt ${10} --maxhostattempt ${11} --hostduration \"${12}\" --hostnotificationnumber ${13} --hostcheckcommand \"${14}\" --hostlatency ${15} --lasthostcheck ${16} --lasthoststatechange ${17} --lasthostup ${18} --lasthostdown ${19} --lasthostunreachable ${20} --hostoutput \"${21}\" --hostaddress \"${22}\" --hostnotesurl \"${23}\" --servicedesc \"${24}\" --servicestate \"${25}\" --servicenotificationnumber ${26} --serviceoutput \"${27}\" --lastservicecheck ${28} --lastservicestatechange ${29} --lastserviceok ${30} --lastservicewarning ${31} --lastservicecritical ${32} --lastserviceunknown ${33} --servicestatetype \"${34}\" --serviceattempt ${35} --maxserviceattempts ${36} --serviceduration \"${37}\" --servicecheckcommand \"${38}\"  --servicedisplayname \"${39}\" --servicelatency ${40} --servicepercentchange ${41} --serviceactionurl \"${42}\" --servicenotesurl \"${43}\" --servicenotes \"${44}\" --timet ${45} --processstarttime ${46} --totalhostsup ${47} --totalhostsdown ${48} --totalhostsunreachable ${49} --totalservicesok ${50} --totalserviceswarning ${51} --totalservicescritical ${52} --totalservicesunknown ${53} --totalhostproblemsunhandled ${54} --totalserviceproblemsunhandled ${55} --notificationauthor \"${56}\" --notificationcomment \"${57}\" --nagiosbp_conf \"${58}\"" >> $ICINGA_MAIL_LOG 2>&1

echo "#### notification sent ####" >> $ICINGA_MAIL_LOG

exit 0