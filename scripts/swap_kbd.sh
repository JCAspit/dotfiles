#!/bin/bash

case $(setxkbmap -query | grep layout | awk '{ print $2 }') in
          us) setxkbmap es;;
		  es) setxkbmap us;;
		   *) setxkbmap us;;
esac
