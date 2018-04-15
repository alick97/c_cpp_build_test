#!/bin/bash
cd target
lcov  -d ../ -t 'MY GCOV' -o show.info -c 
genhtml -o gcov_html show.info
