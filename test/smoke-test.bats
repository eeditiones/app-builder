#!/usr/bin/env bats
# Test expect a prebuild image named builder

@test "ant responds" {
    result=$(docker run --name btest --rm builder ant -version | grep -o '1.10.15')
    [ "$result" == '1.10.15' ]
}

@test "npm responds" {
    run docker run --name btest --rm builder npm -v
     [ "$status" -eq 0 ]
}

@test "xst responds" {
    run docker run --name btest --rm builder xst -v
     [ "$status" -eq 0 ]
}

@test "jinks-cli responds" {
    run docker run --name btest --rm builder jinks -h
     [ "$status" -eq 0 ]
}

@test "git responds" {
    run docker run --name btest --rm builder git -v
     [ "$status" -eq 0 ]
}

@test "blah does not respond" {
    bats_require_minimum_version 1.5.0
    run -127 docker run --name btest --rm builder npmxant -v
     [ "$status" -eq 127 ]
}