#!/bin/bash
superset db upgrade
superset fab create-admin --username admin --firstname admin --lastname admin --email admin --password admin
superset init