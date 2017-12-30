#!./bats/bin/bats

# -- Gitlab provider tests
# /
#

root_dir=..

# Fake get_config
get_config() {
  case $1 in
    .token)
      echo "some_api_token"
      ;;
    .projectId)
      echo "42"
      ;;
    .serverUri)
      echo "localhost"
      ;;
    \?)
      echo $1
  esac
}

curl_fake() {
  echo '[{"id":12345,"sha":"this_is_a_hash","ref":"master","status":"success"}]'
}

setup() {
  export branch=master

  export -f get_config

  export -f curl_fake
  export curl=curl_fake

  export jq=${root_dir}/jq/jq64
}

@test "test bats" {
  hash=$(${root_dir}/ci-providers/gitlab)
  [[ $hash == "this_is_a_hash" ]]
}

