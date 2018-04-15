#!/bin/bash
lcov  -d src -t 'MY GCOV' -o show.info -b coverage_for_so  -c 
genhtml -o gcov_html show.info
