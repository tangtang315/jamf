#!/bin/bash

security authorizationdb write system.preferences allow
security authorizationdb write system.preferences.datetime allow
security authorizationdb write system.preferences allow
security authorizationdb write system.preferences.network allow
security authorizationdb write system.preferences allow
security authorizationdb write system.preferences.sharing allow
security authorizationdb write system.preferences allow
security authorizationdb write system.preferences.security allow

#security authorizationdb write <right-name> [allow|deny|<rulename>]
