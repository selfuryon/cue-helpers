package main

import (
	"regexp"
	"strconv"
)

#SizeConverter: {
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

	ParseSize: {
		input: string
		value: int | *null
		let pattern = "^(?<number>[0-9]+)(?<prefix>[KMGTPE]i?)?$"

		if regexp.Match(pattern, input) == true {
			let r = regexp.FindNamedSubmatch(pattern, input)
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
}

_tests: {
	test1: #SizeConverter.ParseSize & {
		input: "1Ki"
		value: 1024
	}

	test2: #SizeConverter.ParseSize & {
		input: "1M"
		value: 1000000
	}

	test3: #SizeConverter.ParseSize & {
		input: "5Gi"
		value: 5368709120
	}
	test4: #SizeConverter.ParseSize & {
		input: "5K"
		value: 5000
	}
	test5: #SizeConverter.ParseSize & {
		input: "5iK"
		value: null
	}
}
