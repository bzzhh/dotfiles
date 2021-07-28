<?php

return (new PhpCsFixer\Config())->setRiskyAllowed(true)->setRules([
    "@Symfony" => true,
    "array_indentation" => true,
    "binary_operator_spaces" => [
        "operators" => ["=>" => "align", "=" => "align"],
    ],
    "declare_strict_types" => true,
    "native_function_invocation" => ["include" => ["@compiler_optimized"]],
    "no_alias_functions" => true,
    "no_extra_blank_lines" => [
        "tokens" => [
            "break",
            "continue",
            "curly_brace_block",
            "extra",
            "parenthesis_brace_block",
            "return",
            "square_brace_block",
            "throw",
            "use",
        ],
    ],
    "echo_tag_syntax" => true,
    "no_useless_else" => true,
    "no_useless_return" => true,
    "ordered_class_elements" => true,
    "phpdoc_add_missing_param_annotation" => true,
    "phpdoc_order" => true,
]);
