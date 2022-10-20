#!/bin/bash
val = $(curl -v localhost:8765/sum?a=1\&b=2)
test val -eq 3
