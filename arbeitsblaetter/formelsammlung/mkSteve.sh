#!/usr/bin/bash

pdftk FormelsammlungGESO_DEST.pdf burst

cp blank_steve.pdf_fix blank.pdf

pdftk pg_0001.pdf pg_0002.pdf blank.pdf blank.pdf pg_0003.pdf pg_0004.pdf blank.pdf blank.pdf pg_0005.pdf pg_0006.pdf blank.pdf blank.pdf pg_0007.pdf pg_0008.pdf blank.pdf blank.pdf  pg_0009.pdf pg_0010.pdf blank.pdf blank.pdf  pg_0011.pdf pg_0012.pdf blank.pdf blank.pdf pg_0013.pdf pg_0014.pdf blank.pdf blank.pdf pg_0015.pdf pg_0015.pdf blank.pdf blank.pdf  cat output steve.pdf


rm pg_00*.pdf
