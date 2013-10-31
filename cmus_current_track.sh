#!/bin/sh

cmus-remote -C status | grep ^stream | cut -d' ' -f2-
