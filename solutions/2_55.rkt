#lang sicp

;This is because the expression evaluates to (car (quote (quote abracadabra))) which is equivalent to car of list (quote abracadabra).

;test
(car ''abracadabra)
