#!/bin/bash
test  $(curl  172.18.0.3:8080/sum?a=1\&b=2) -eq 3
