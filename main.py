#!/usr/bin/env python
# -*- coding: utf-8 -*-


def fib(n):
    return 1 if (n == 1 or n == 2) else fib(n - 1) + fib(n - 2)

print "Python"
for i in xrange(1, 20):
    print "%d" % fib(i),
