extends Node
class_name StringUtils

static func isBlank(input_str: String) -> bool:
	return input_str == "" or input_str == null

static func isNotBlank(input_str: String) -> bool:
	return input_str != null and input_str != ""
