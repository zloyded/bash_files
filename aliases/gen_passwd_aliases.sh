#!/bin/bash
function genpass {
	LEN=$1
	dd if=/dev/urandom bs=$LEN count=1 2>/dev/null| base64;
}


