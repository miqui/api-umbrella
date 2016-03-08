API_UMBRELLA_VERSION_BASE="0.11.0"
API_UMBRELLA_VERSION_PRE="" # pre1, pre2, etc.
API_UMBRELLA_VERSION_PACKAGE_ITERATION="1"

if [ -n "$API_UMBRELLA_VERSION_PRE" ]; then
  API_UMBRELLA_VERSION_PACKAGE_ITERATION="0.$API_UMBRELLA_VERSION_PACKAGE_ITERATION.$API_UMBRELLA_VERSION_PRE"
  API_UMBRELLA_VERSION="$API_UMBRELLA_VERSION_BASE-$API_UMBRELLA_VERSION_PRE"
else
  API_UMBRELLA_VERSION="$API_UMBRELLA_VERSION_BASE"
fi
