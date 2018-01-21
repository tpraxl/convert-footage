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

@test "calling convert-footage with -h prints usage to std::out" {
	run ./convert-footage -h
	[ "$status" -eq 0 ]
	assert_usage_in "${output}"
}

@test "calling convert-footage with -e prints examples to std::out" {
	run ./convert-footage -e
	[ "$status" -eq 0 ]
	assert_examples_in "${output}"
}

assert_examples_in() {
	local output="$1"
	[[ "${output}" == *"# Convert current folder with best quality"* ]]
	[[ "${output}" == *"# Convert the current folder with quality 1"* ]]
	[[ "${output}" == *"# Convert folder ../myvideos with best quality (default)"* ]]
	[[ "${output}" == *"# Convert folder ../myvideos but do not search for mime types"* ]]
	[[ "${output}" == *"# Convert file ./myvideo.mp4 with quality 1"* ]]
	[[ "${output}" == *"# Show help"* ]]
}

@test "calling convert-footage with illegal -q value reports useful error message" {
	local expected="Quality needs to be a positive integer. The lower the value, the better the quality."
	run ./convert-footage -q a
	[ "$status" -eq 1 ]
	[[ "${output}" == *"${expected}"* ]]

	run ./convert-footage -q -1
	[ "$status" -eq 1 ]
	[[ "${output}" == *"${expected}"* ]]

	run ./convert-footage -q
	[ "$status" -eq 1 ]
	assert_usage_in "${output}"
}

@test "calling convert-footage with illegal -s value reports useful error message" {
	run ./convert-footage -s a
	[ "$status" -eq 1 ]
	[[ "${output}" == *"Invalid search type a. Allowed types: suffix or mime"* ]]

	run ./convert-footage -s 1
	[ "$status" -eq 1 ]
	[[ "${output}" == *"Invalid search type 1. Allowed types: suffix or mime"* ]]

	run ./convert-footage -s
	[ "$status" -eq 1 ]
	assert_usage_in "${output}"
}
