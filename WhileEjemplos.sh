#!/usr/bin/env bash
#Los bucles por ejemplo: while [ $# -eq -ne -gt -lt -ge -le ]

cont=1
while [ $# -eq -1 ]
  do
      echo parámetro numero ${cont}: $1
      shift
      cont=`expr ${cont} + 1 `
  done
 
