#!/usr/bin/env bats

@test "calling convert-footage with illegal arguments reports an error and prints usage" {
	run ./convert-footage -x
	[ "$status" -eq 1 ]
	# get first line of output (includes std::err)
	first_line=$(echo "${output}" | head -1)
	# assert first line matches expected output substring
	# this prevents color codes from producing a failure as opposed to
	# a check like this: "${first_line}" = "Invalid option:x"
  [[ "${first_line}" == *"Invalid option: x"* ]]
  assert_usage_in "${output}"
}

assert_usage_in() {
	local output="$1"
	[[ "${output}" == *"####"* ]]
  [[ "${output}" == *"Usage"* ]]
  [[ "${output}" == *"Options"* ]]
}
