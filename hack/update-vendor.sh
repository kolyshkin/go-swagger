#!/bin/sh

# This file is just wrapper around vndr (github.com/LK4D4/vndr) tool.
# For updating dependencies you should change `vendor.conf` file in root of the
# project. Please refer to https://github.com/LK4D4/vndr/blob/master/README.md for
# vndr usage.

set -e

if ! hash vndr; then
	echo "Please install vndr with \"go get github.com/LK4D4/vndr\" and put it in your \$GOPATH"
	exit 1
fi

if [ $# -eq 0 ] || [ "$1" != "github.com/go-openapi/spec" ] && [ "$1" != "github.com/go-openapi/jsonpointer" ] ; then
	# github.com/go-openapi/spec vendor has local changes, see f6063789
	# github.com/go-openapi/jsonpointer vendor has local changes, see 5793aa66
	vndr -whitelist=^github.com/go-openapi/spec -whitelist=^github.com/go-openapi/jsonpointer "$@"
fi
