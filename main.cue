package main

import (
	"regexp"
	"strconv"
)

#Number: {
	_multipliers: {
		Ki: 1024
		Mi: 1024 * Ki
		Gi: 1024 * Mi
		Ti: 1024 * Gi
		Pi: 1024 * Ti
		Ei: 1024 * Ei

		K: 1000
		M: 1000 * K
		G: 1000 * M
		T: 1000 * G
		P: 1000 * T
		E: 1000 * P
	}

    value: int
    value_postfix: string

    let pattern = "^(?<number>[0-9]+)(?<prefix>[KMGTPE]i?)?$"
    if regexp.Match(pattern, value_postfix) == true {
        let r = regexp.FindNamedSubmatch(pattern, value_postfix)
        let num = strconv.Atoi(r.number)
        let pref = r.prefix

        if pref == "" {
            value: num
        }
        if pref != "" {
            value: num * _multipliers[pref]
        }
    }
}

tests: {
	test1: #Number & {
		value_postfix: "1Ki"
		value: 1024
	}

	test2: #Number & {
		value_postfix: "1M"
		value: 1000000
	}

	test3: #Number & {
		value_postfix: "5Gi"
        value: 5368709120

	}
	test4: #Number & {
		value_postfix: "5K"
		value: 5000
	}
	test5: #Number & {
		value_postfix: "5Ki"
        value: 5120
	}
}
